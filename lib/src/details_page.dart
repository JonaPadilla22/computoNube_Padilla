import 'package: flutter/material.dart';
import 'package: image_downloader/image_downloader.dart'; 
import 'package:practica_19v2/src/pdf_preview.dart'; 
import' package:practica_19v2/ut/details_container.dart'; 
import 'package:practica_19v2/ui/head_container.dart';
class DetailsPage extends StatelessWidget {
  var datosName;
  var datosGender;
  String? datos Image;
  String? path;

  DetailsPage({
    this.datosNane,
    this.datosGender, this.datos Image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datosName+ 'Details'),
        backgroundColor: Color(0xFFFF422C),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(@xFF272A3C),
        width: double. infinity,
        height: double. infinity,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datos Image),
            MyDetailContainer(nom: datosName, sexo: datosGender),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(@xFFFF422C),
        child: Icon(Icons.print_outlined), 
        onPressed: () {
          _downloadImage();
          Future.delayed(
            Duration(milliseconds: 3800),
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)-> PdfPage( 
                  nombre: datosName, 
                  genero: datosGender,
                  imagenurl: path,
                )
              )
            )
          );
        }
      )
    );
  }
}

_downloadImage() async {
  try {
    String? imageId = await ImageDownloader.downloadImage(datosImage!); 
    _path= await ImageDownloader.findPath(imageId!);
  } catch (error) {
    print(error);
  }
}