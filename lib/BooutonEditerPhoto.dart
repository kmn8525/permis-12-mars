
import 'package:flutter/material.dart';
import 'Constantes.dart';

class BoutonEditerPhoto extends StatelessWidget {



  final Widget bouton1;

  final Widget bouton2;

  const BoutonEditerPhoto({Key key, this.bouton1, this.bouton2}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
         child: bouton1 ,


      ),
    );

  }



}