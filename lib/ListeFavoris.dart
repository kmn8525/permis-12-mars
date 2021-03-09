import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Option.dart';
import 'Question.dart';

class Favoris  with  ChangeNotifier , DiagnosticableTreeMixin {


  int _numeroQuestion  = 0 ;

  int _numeroChoix = 0  ;

  String cleNumQD = "qDef";
  String cleNumCD = "cDef";
  String cleNumQCO = "qCon";
  String cleNumCCO = "cCon";

  bool serieFini = false;

  int total = 15;

  int NbBonneReponse = 0;

  int NbMovaiseReponse = 0;

  int NbQuestionReondue = 0;

  Color commencer = Colors.black;

  Color enCours = Colors.lightBlue;



  List<Question> _listeFavoris = [ ];

  List<Option> _listeDeChoix = [ ] ;


  bool   VerificationQuestionFavoris( String  value ) {



    print(value) ;


   if ( _listeFavoris.contains(value)) {
     return true ;
   }
   else {
     return false ;
   }



  }



  void ajouterQuestion( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint , String cheminImage , int numeroImage ){


      final tampon =  Question.Q2(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint , cheminImage ,numeroImage )  ;
    _listeFavoris.add(tampon) ;
    notifyListeners() ;

      print('----------Liste de favoris juste apres lajout-------------') ;

      print(_listeFavoris) ;
  }

  void afficheFavoris() {
     print('----------Liste de favoris-------------') ;

     print(_listeFavoris) ;




  }


  void ajouterReponse(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){

    final tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
    _listeDeChoix.add(tampon) ;
    notifyListeners() ;

  }

  void   SetNumQueOpt( int value ) {


    print('dans sauvegarder value') ;

    print(value) ;

    _numeroQuestion = value ;
    _numeroChoix = value ;


    notifyListeners();

  }





  String get getCleNumQueDef =>  cleNumQD ;

  int get getNumQueDef =>  _numeroQuestion ;
  int get getNumChoDef =>  _numeroChoix ;


  String getIdQuestion() {
    return _listeFavoris[_numeroChoix].id;
  }

  String getIdOption() {
    return _listeDeChoix[_numeroChoix].id;
  }


  List listeQuestionFavoris() {
    return _listeFavoris;
  }

  List listeOptionDefinition() {
    return _listeDeChoix;
  }

  int getTaille() {
    return _listeFavoris.length;
  }

  String getOptionA() {
    return _listeDeChoix[_numeroChoix].option_A;
  }

  String getOptionB() {
    return _listeDeChoix[_numeroChoix].option_B;
  }

  String getOptionC() {
    return _listeDeChoix[_numeroChoix].option_C;
  }


  String getQuestionText() {
    return _listeFavoris[_numeroQuestion].questionText;
  }

  bool getBonneReponseA() {
    return _listeFavoris[_numeroQuestion].reponse_A;
  }

  bool getBonneReponseB() {
    return _listeFavoris[_numeroQuestion].reponse_B;
  }

  bool getBonneReponseC() {
    return _listeFavoris[_numeroQuestion].reponse_C;
  }


  bool getFauteGrave() {
    return _listeFavoris[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
    return _listeFavoris[_numeroQuestion].explication;
  }

  int getPoint() {
    return _listeFavoris[_numeroQuestion].point;
  }

  void questionSuivante() {
    if (_numeroQuestion <= _listeFavoris.length - 1) {
      _numeroQuestion++;
    }
  }

  void optionSuivante() {
    if (_numeroChoix <= _listeDeChoix.length - 1) {
      _numeroChoix++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeFavoris.length - 1) {
      return true;
    } else {
      return false;
    }
  }


  void reset() {
    _numeroQuestion = 0;
    _numeroChoix = 0;
  }

}











