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

  String cleListeSauvegarder = "listFavoriSauver";


  bool serieFini = false;

  int total = 15;

  int NbBonneReponse = 0;

  int NbMovaiseReponse = 0;

  int NbQuestionReondue = 0;

  Color commencer = Colors.black;

  Color enCours = Colors.lightBlue;



  List<Question> _listeQuestionFavoris = [

  ];

  List<Option> _listeDeChoixFavoris = [ ] ;


  bool   VerificationQuestionFavoris( String  value ) {



     if ((_listeQuestionFavoris.singleWhere((innerElement) => innerElement.id == value,
        orElse: () => null)) != null) {

      return true ;
    } else {

      return false ;

    }



  }

  int retourneIndiceQuestion( String value){

    var  indice =  _listeQuestionFavoris.indexWhere((innerElement) => innerElement.id == value);

    return indice ;
  }


  void ajouterQuestion( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint , String cheminImage , int numeroImage ){


      final tampon =  Question.Q2(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint , cheminImage ,numeroImage )  ;
    _listeQuestionFavoris.add(tampon) ;
    notifyListeners() ;


   }




  void ajouterReponse(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){

    final tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
    _listeDeChoixFavoris.add(tampon) ;
    notifyListeners() ;

  }

  void   SetNumQueOpt( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;


    notifyListeners();

  }




  String get getcleListeSauvegarder =>  cleListeSauvegarder ;

  String get getCleNumQueDef =>  cleNumQD ;

  int get getNumQueDef =>  _numeroQuestion ;
  int get getNumChoDef =>  _numeroChoix ;

  void RemoveQuestions( int IdAsuprimer) {

      _listeQuestionFavoris.removeAt(IdAsuprimer);
  }




  String getIdQuestion() {
    return _listeQuestionFavoris[_numeroChoix].id;
  }

  String getIdOption() {
    return _listeDeChoixFavoris[_numeroChoix].id;
  }


  List listeQuestionFavoris() {
    return _listeQuestionFavoris;
  }

  List listeOptionDefinition() {
    return _listeDeChoixFavoris;
  }

  int getTaille() {
    return _listeQuestionFavoris.length;
  }

  String getOptionA() {
    return _listeDeChoixFavoris[_numeroChoix].option_A;
  }

  String getOptionB() {
    return _listeDeChoixFavoris[_numeroChoix].option_B;
  }

  String getOptionC() {
    return _listeDeChoixFavoris[_numeroChoix].option_C;
  }



  String getQuestionText() {
    return _listeQuestionFavoris[_numeroQuestion].questionText;
  }

  int getNumeroImage() {
    return _listeQuestionFavoris[_numeroQuestion].numeroImage;
  }

  String getCheminImage() {
    return _listeQuestionFavoris[_numeroQuestion].cheminImage;
  }


  int getPoint() {
    return _listeQuestionFavoris[_numeroQuestion].point;
  }

  bool getBonneReponseA() {
    return _listeQuestionFavoris[_numeroQuestion].reponse_A;
  }

  bool getBonneReponseB() {
    return _listeQuestionFavoris[_numeroQuestion].reponse_B;
  }

  bool getBonneReponseC() {
    return _listeQuestionFavoris[_numeroQuestion].reponse_C;
  }


  bool getFauteGrave() {
    return _listeQuestionFavoris[_numeroQuestion].fauteGrave;
  }

  String getExplication() {
    return _listeQuestionFavoris[_numeroQuestion].explication;
  }


  void questionSuivante() {
    if (_numeroQuestion <= _listeQuestionFavoris.length - 1) {
      _numeroQuestion++;
    }
  }

  void optionSuivante() {
    if (_numeroChoix <= _listeDeChoixFavoris.length - 1) {
      _numeroChoix++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeQuestionFavoris.length - 1) {
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











