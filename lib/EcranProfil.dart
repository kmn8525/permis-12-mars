

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permis/Constantes.dart';

import 'Acceuil.dart';
import 'Dessiner.dart';
import 'Utility.dart';


class EcranProfil extends StatefulWidget  {
  @override
  EcranProfilState createState() => EcranProfilState();

}

class EcranProfilState extends State<EcranProfil>  with ChangeNotifier , DiagnosticableTreeMixin  {


  Future<File> imageFile;
  Image imageFromPreferences;
  String cleNom = "n";
  String cleImage = "i";
  String newTaskTitle= 'Entrez Votre Nom';



  @override
  void dispose() {

    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    Utility.instance.getStringValue(cleNom)
        .then((value) => setState(() {
      newTaskTitle = value;


    }));


    chargerImageDisque();

  }

  String getcleImage(){
return cleImage ;
  }
  String getcleNom(){
return cleNom ;
  }
   chargerImageDisque() {
    Utility.getImageFromPreferences(cleImage).then((value) {
      if (null == value) {
        return;
      }
      setState(() {
       imageFromPreferences = Utility.imageFromBase64String(value);
      });
    });

  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  pickImageCamera(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }
  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: Text('Prendre une photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),


                      onTap: (){ pickImageCamera(ImageSource.camera) ;

                      setState(() {
                        imageFromPreferences = null;
                      });
                      }

                  ),

              Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                      child: Text('Selection une image a partir de la gallery ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                      onTap: ()  {
                        pickImageFromGallery(ImageSource.gallery);
                        setState(() {
                          imageFromPreferences = null;
                        });

                      }


                  ),

                ],
              ),
            ),
          );
        });
  }





  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: kCouleurBody ,
      body: Stack(
        alignment: Alignment.center,

        children: <Widget>[
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: DessinIncurveProfil( ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
                    Container(

                      // height: 100,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back
                        ),
                        onPressed: (){
                          Navigator.of(context, rootNavigator: false ).push(MaterialPageRoute(
                              builder: (BuildContext context  ) => Accueil( )));

                         // Navigator.pop(context);

                        },
                      ),
                      padding: EdgeInsets.fromLTRB(0, 30, 300, 0),
                    ) ,



              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                 decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  // image: DecorationImage(
                  //   image: AssetImage(null),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child:  _constructeurImageProfil(),



              ),


              // SizedBox(height: screenSize.height / 6.4),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[

                        _constructeurNom(context),
                        _ConstructeurSeparateur(screenSize),
                        SizedBox(height: 13.0),
                        SizedBox(height: 10.0),
                        _constructeurBouttons(),

                      ]
                  ),
                ),
              ),
                  ],
                ),



        ],

      ),
    );
  }



Widget _editionPhotoProfil(){

    return Container(

        padding: EdgeInsets.fromLTRB(100, 0, 0, 80),
        child: ClipOval(
          child: Material(
            color: Colors.white, // button color
            child: InkWell(
              splashColor: Colors.blue, // inkwell color
              child: SizedBox(width: 50, height: 50,
                  child: Container(
                    width: 500,
                    height: 500,
                    //padding:EdgeInsets.symmetric(horizontal: 200) ,
                    child: Icon(


                        Icons.edit),
                  )
              ),
              onTap: (){

              },
            ),
          ),
        ),


    );


}



  Widget _constructeurImageProfil() {
    return Stack(
      children: <Widget>[


    Container(
      child: GestureDetector(
            child:  Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kBoutonDegrade,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],

                ) ,

                child: imageFromPreferences != null
                    ?
                ClipOval(
                  child: Container(
                    width: 95,
                    height: 95,
                    child: imageFromPreferences,

                  ),
                )

                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 95,
                  height: 95,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),


              ),
            ),

        onTap: () {
          _optionsDialogBox();

        },
          ),
    ),
          ClipOval(
          child: Container(
         // margin: EdgeInsets.fromLTRB(151, 1, 151, 0),
          width: 97,
          height: 97,
          child: imageEnregistre(),

          ),
          ) ,


      ],
    ) ;
  }

  Widget imageEnregistre() {

    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data != null  ) {

          Utility.saveImageToPreferences( cleImage ,
              Utility.base64String(snapshot.data.readAsBytesSync()));

          return ClipOval(
              child: Image.file(
                snapshot.data,
                width: 90,
                height: 90,
                fit: BoxFit.cover,

              ),


          ) ;
        } else if ( snapshot.error  != null) {
          return const Text(
            'Erreur -> Reception image',
            textAlign: TextAlign.center,
          );
        } else {
          return Container(

          ) ;
        }
      },
    );
  }
  Widget _constructeurNom(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),

      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                '$newTaskTitle',

                style: TextStyle(
                  fontFamily: 'Spectral',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),

              ),
            ),
          ),


           Container(

              padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
              child: ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.blue, // inkwell color
                    child: SizedBox(width: 30, height: 30, child: Icon(Icons.edit)),
                    onTap: (){
                      showModalBottomSheet(

                         context: context,
                         isScrollControlled: true,
                         builder: (context) => SingleChildScrollView(
                         child:Container(
                           padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                           child: EcranModifierNomProfil(context ),
                         ),
                       ) ,
                     );


                    },
                  ),
                ),
              ),

            ),
        ],
      ),
    );
  }
  Widget EcranModifierNomProfil(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Entren Votre Nom',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Utility.instance
                    .setStringValue(cleNom, newTaskTitle);
                Navigator.pop(context);
                notifyListeners();
              },

            ),
          ],
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



}

