import 'package:flutter/material.dart';
import 'Constantes.dart';

class BoutonEditionProfil extends StatelessWidget {

  BoutonEditionProfil (  {@required this.boutonEnfant, this.onPressed});


  final Widget boutonEnfant;

  final Function onPressed;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child :Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(

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
        child: boutonEnfant,

      ),

    );

  }



}