import 'package:flutter/material.dart';
import 'Constantes.dart';
import 'EcranProfil.dart';
import 'NomProfil.dart';
import 'package:provider/provider.dart';

import 'Utility.dart';

class BouttonProfil extends StatefulWidget {

  final Image imageFromPreferences;

  final Function onPressed;
  final String nom ;


  BouttonProfil({Key key, this.imageFromPreferences, this.onPressed, this.nom})
      : super(key: key);

  @override
  BouttonProfilState createState() => BouttonProfilState();

}


class BouttonProfilState extends State<BouttonProfil>  {



  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child:  Center(
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
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

                child: widget.imageFromPreferences != null
                    ?
                ClipOval(
                  child: Container(
                    width: 95,
                    height: 95,
                    child: widget.imageFromPreferences,

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

          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 1, top: 5),
            child: Text(
              '${widget.nom}',
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.3,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      ),
      onPressed: widget.onPressed,
    );
  }
}
