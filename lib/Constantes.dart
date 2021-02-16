import 'package:flutter/material.dart';


const kStyletexteButon = TextStyle(
  fontSize: 8.5  ,
  fontWeight: FontWeight.bold ,

  color: Color(0xff050505) ,
) ;
const kStyleTextLong = TextStyle(
  fontSize: 5.0  ,
  fontWeight: FontWeight.bold ,
  color: Color(0xff050505) ,
) ;

const TextStyle optionStyleTextBar =
TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Thèmes',
    style: optionStyleTextBar,
  ),
  Text(
    'Index 1: Cours',
    style: optionStyleTextBar,
  ),
  Text(
    'Index 2: Examens',
    style: optionStyleTextBar,
  ),
  Text(
    'Index 3: Jeux',
    style: optionStyleTextBar,
  ),
  Text(
    'Index 4: Réglages',
    style: optionStyleTextBar,
  ),
];


const kCouleurAppBar =  Color(0xffffffff) ;
const kBoutonDegrade = Color(0x29000000) ;
const kCouleurScaffold =  Color(0xffffffff) ;
const kCouleurBody = Color(0xfff3f8ff)  ;
////F5F5F8
//Color(0xffE5EDF3)  ;
//f9f7f7
//fbfbfb
//f3f8ff
//ecfcff
//fef6fb
//e2eff1
//fffdfb
//fafafa
//faf9f9
//ebf7fd
//f9f9f9
//edf7fa

const kCouleurBodyTheme = Color(0xffEFF2F4)  ;
const Color black54 = Color(0x8A000000);

const couleur_bouton = Colors.black38;

/*
Future < void > DelaiReponse() async {
  await Future.delayed(Duration(seconds:  1), () {


    _animationController.addStatusListener((status) {

      setState(() {

        if ( status == AnimationStatus.completed) {
          print('object') ;
          Provider.of<EcranQuestionsState>(context , listen: false).checkAnswer(null, null, null);
          Provider.of<EcranQuestionsState>(context , listen: false).BoutonSuivant();

          //_animationController.repeat();
        }
      });


    }) ;
    _animationController.addListener( () {
      setState(() { });
    });
    _animationController.forward();
    // _animationController.repeat();

  });



}
*/
