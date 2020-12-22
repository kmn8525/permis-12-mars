import 'package:flutter/material.dart';
import 'Constantes.dart';

final String _nomPrenom = "MATIAL MONKAM";


class BouttonProfil extends StatelessWidget {
  BouttonProfil({ @required this.CheminImage , @required this.onPressed });

  final String CheminImage ;

  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(CheminImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(17.0),
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
            ),
          ),

          _nomProfil(),

        ],
      ),
      onPressed: onPressed,

    );
  }
}

Widget _nomProfil() {
  TextStyle _nameTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w700,


  );

  return Container(
    padding: EdgeInsets.all(10),
    child: Text(

      _nomPrenom,
      style: _nameTextStyle,
    ),
    decoration: BoxDecoration(
      border:  Border.all(
        color: Colors.white,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}