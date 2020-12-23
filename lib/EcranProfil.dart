
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/Constantes.dart';
final String _NomPrenom = "Kameni Monkam Martial";

  File _imageFile;
dynamic _pickImageError;

class EcranProfil extends StatefulWidget {
  @override
  _EcranProfilState createState() => _EcranProfilState();
}

class _EcranProfilState extends State<EcranProfil> {




  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kCouleurBody ,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //  SizedBox(height: screenSize.height / 6.4),
                  _constructeurImageProfil(),
                  _constructeurNom(context),
                  _ConstructeurSeparateur(screenSize),
                  SizedBox(height: 13.0),
                  SizedBox(height: 10.0),
                  _constructeurBouttons(),

                ],
              ),
            ),
          ),
          Container(
            height: 100,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ) ,

          _visualiserImage(),
        ],
      ),
    );
  }


}

Widget _constructeurImageProfil() {
  return Stack(
    children: <Widget>[
  Center(
  child: Container(
    width: 140.0,
    height: 140.0,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/profil/martial.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(80.0),
      border: Border.all(
        color: Colors.white,
        width: 3.0,
      ),
    ),
  ),

  ),
      Container(
        child: Positioned(
          bottom: 10, right: 130, //give the values according to your requirement
          child: GestureDetector(
              child: Icon(Icons.folder_shared ,
              size: 50, ) ,
            onTap: (){
              _onImageButtonPressed(ImageSource.gallery);
            },

          ),
        ),
      ),
    ],
  ) ;
}


Widget _constructeurNom(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Text(
      _NomPrenom,
      style: TextStyle(
        fontFamily: 'Spectral',
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
Widget _ConstructeurSeparateur(Size screenSize) {
  return Container(
    width: screenSize.width / 1.6,
    height: 1.0,
    color: Colors.black54,
    margin: EdgeInsets.only(top: 4.0),
  );
}



Widget _constructeurBouttons() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () => print("followed"),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Color(0xFF404A5C),
              ),
              child: Center(
                child: Text(
                  "PROFIL",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 14.0),
        Expanded(
          child: InkWell(
            onTap: () => print("THEME"),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "THEME",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 14.0),

        Expanded(
          child: InkWell(
            onTap: () => print("EXAMEN"),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "EXAMEN",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    ),
  );
}

void _onImageButtonPressed(ImageSource source) async {
  try {
    _imageFile = await ImagePicker.pickImage(
      source: source,
    );
  } catch (e) {
    _pickImageError = e;
  }
}
Widget _visualiserImage() {
  if (_imageFile != null) {
    return Image.file(_imageFile);
  } else if (_pickImageError != null) {
    return Text(
      'Erreur de récupération d\'image: $_pickImageError',
      textAlign: TextAlign.center,
    );
  } else {
    return const Text(
      'Aucune image',
      textAlign: TextAlign.center,
    );
  }
}


