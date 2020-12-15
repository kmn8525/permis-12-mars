import 'package:flutter/material.dart';
import 'Constantes.dart';

class BoutonReponse extends StatelessWidget {

  BoutonReponse (  {@required this.couleur, @required this.boutonEnfant, this.apuyer});

  final Color couleur;

  final Widget boutonEnfant;

  final Function apuyer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: apuyer,
      child: Container(
        child: boutonEnfant,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          color: kCouleurAppBar,
          boxShadow: [
            BoxShadow(
              color: kBoutonDegrade,
              offset: Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        height: 50.0,
        width: 50,
      ),
    );

  }



}