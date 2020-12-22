import 'package:flutter/material.dart';
import 'BouttonProfil.dart';
import 'Constantes.dart';


class BoutonTheme extends StatelessWidget {
  BoutonTheme(
      {@required this.couleur, @required this.boutonEnfant, this.apuyer});

  final Color couleur;

  final Widget boutonEnfant;

  final Function apuyer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: apuyer,
      child: Container(
        child: boutonEnfant,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
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
        height: 100.0,
        width: 50,
      ),
    );
  }
}
