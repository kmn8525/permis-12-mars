import 'package:flutter/material.dart';
import 'NomProfil.dart';
import 'package:provider/provider.dart';

class BouttonProfil extends StatelessWidget {
  BouttonProfil({@required this.CheminImage, @required this.onPressed});

  final String CheminImage;

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
                width: 1.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 1, top: 5),
            child: Text(
              '${context.watch<NomProfil>().NomPersonne}',
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
      onPressed: onPressed,
    );
  }
}
