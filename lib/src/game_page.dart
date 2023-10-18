// import 'package:computonube_padilla/src/card_widget.dart';
import 'package:computonube_padilla/src/home_page.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'dart:math';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GamePage extends StatefulWidget {
  final Data data;
  final List<GlobalKey<FlipCardState>> cardKeys;

  GamePage({required this.data})
      : cardKeys = List.generate(data.num_pairs * 2, (index) => GlobalKey<FlipCardState>());
  @override
  State<GamePage> createState() => _GamePageState(data: data, cardKeys: cardKeys);
}

class _GamePageState extends State<GamePage> {
  final Data data;
  final List<GlobalKey<FlipCardState>> cardKeys;

  _GamePageState({required this.data, required this.cardKeys});

  final _isHours = false;
  int firstCard = -1;
  int secondCard = -1;
  int firstNumber = -1;
  int secondNumber = -1;
  int record = 0;

  bool isBusy = false;
  List<int> flippeds = [];
  List<int> gameCards = []; 

  int recordInSeconds = 0;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onStopped: () {
      // print('onStop');
    },
    onEnded: () {
      // print('onEnded');
    },
  );

  void handleFlip(int index, int number) async {
    if (!isBusy) {
      if (firstCard == -1) {
        firstCard = index;
        firstNumber = number;
      } else {
        if (secondCard == -1) {
          secondCard = index;
          secondNumber = number;
        }
        if (firstNumber == secondNumber) {
          flippeds.add(number);
          firstCard = -1;
          secondCard = -1;
          if(flippeds.length==data.num_pairs){
            //alerta ganador
            await Fluttertoast.showToast(
              msg: "FELICIDADES, GANASTE!!",
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.green,
              gravity: ToastGravity.CENTER,
              fontSize: 30.0
            );

            _stopWatchTimer.onStopTimer();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            int actualRecord = prefs.getInt('${data.num_pairs}-pairs') ?? 0;
            int time = _stopWatchTimer.secondTime.value;
            if(actualRecord>time || actualRecord==0){
               await Fluttertoast.showToast(
                msg: "Nuevo récord: $time segundos",
                toastLength: Toast.LENGTH_LONG,
                backgroundColor: Colors.green,
                gravity: ToastGravity.CENTER,
                fontSize: 30.0
              );
              prefs.setInt('${data.num_pairs}-pairs', time);
            }
            await Future.delayed(Duration(milliseconds: 5000));
            Navigator.of(context).pop();
            return;
          }
          setState(() {
            
          });
        } else {
          isBusy = true;
          if(cardKeys[secondCard].currentState!.isFront){
            await Future.delayed(Duration(milliseconds: 800));
            cardKeys[firstCard].currentState!.toggleCard();
            cardKeys[secondCard].currentState!.isFront = false;
            cardKeys[secondCard].currentState!.toggleCard();
            isBusy = false;
          }
          firstCard=-1;
          secondCard=-1;
        }
      }
    }else{
      cardKeys[index].currentState!.isFront = false;
    }
  }

  void obtainRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int actualRecord = prefs.getInt('${data.num_pairs}-pairs') ?? 0;
    setState(() {
      recordInSeconds = actualRecord;
    });
  }

  @override
  void initState() {
    super.initState();
    gameCards = generateShuffledCards(data.num_pairs, 12);
    obtainRecord();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.8 / 4);
    List<Widget> cards = List.generate(gameCards.length, (index) {
      return FlipCard (
        key: cardKeys[index],
        onFlip: () {
          if(cardKeys[index].currentState!.isFront){
            handleFlip(index, gameCards[index]);
          }
        },
        flipOnTouch: !flippeds.contains(gameCards[index]),
        direction: FlipDirection.HORIZONTAL,
        front: Center(
          child: Container(
            child: Image.asset('assets/back.png', fit: BoxFit.fill,),
          ),
        ),
        back: Center(
          child: Container(
            child: Image.asset('assets/${gameCards[index]}.png', fit: BoxFit.fill,),
          ),
        ),
      );
    });

    String record = _formatTime(recordInSeconds);

    _stopWatchTimer.onStartTimer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego'),
        centerTitle: true,
        foregroundColor: const Color(0xff0e2050),
      ),
      body: Column(
        children: [
          Expanded(
            child: ResponsiveGridList(
              desiredItemWidth: itemWidth,
              minSpacing: 10,
              children: List.generate(cards.length, (index) {
                  return Container(
                    height: (MediaQuery.of(context).size.height * 0.7) / (data.num_pairs / 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: cards[index])
                  );
                }
              ),
            )
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data!;
                    final displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Récord: $record",
                            style: const TextStyle(
                              color: Color(0xff0e2050),
                              fontSize: 20,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            displayTime,
                            style: const TextStyle(
                              color:Color(0xff0e2050),
                              fontSize: 40,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}

String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

List<int> generateShuffledCards(num_pairs, max_pairs) {
  Random random = Random();
  List<int> cards = List.generate(12, (index) => index + 1);
  List<int> cardsAux = List.generate(12, (index) => index + 1);
  List<int> randoms = [];
  cardsAux.addAll(cards);
  cardsAux.shuffle();
  for (int i = 0; i < max_pairs - num_pairs; i++) {
    int randomNumber = random.nextInt(12) + 1;
    while(randoms.contains(randomNumber)){
      randomNumber = random.nextInt(12) + 1;
    }
    randoms.add(randomNumber);
    cardsAux.removeWhere((element) => element==randomNumber);
  }
  return cardsAux;
}

