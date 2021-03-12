import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Option.dart';
import 'Question.dart';

class ConducteurPassager with  ChangeNotifier , DiagnosticableTreeMixin  {
  int _numeroQuestion = 0;
  int _numeroChoix = 0;

  String cleNumQcondPass = "qConPass";
  bool serieFini = false;

  int total = 15;

  int NbBonneReponse = 0;

  int NbMovaiseReponse = 0;

  int NbQuestionReondue = 0;

  Color commencer = Colors.black;

  Color enCours = Colors.lightBlue;


  ConducteurPassager.C1( int a ) {
    _numeroQuestion = a ;
    _numeroChoix = a ;

  }
  ConducteurPassager.C2( ) ;


  String get getCleNumQueCondPass =>  cleNumQcondPass ;
  int get getNumQuestionCondPass =>  _numeroQuestion ;
  int get getNumChoixCondPass=>  _numeroChoix ;

  void   SetNumQueCondPass( int value ) {


    _numeroQuestion = value ;
    _numeroChoix = value ;

    notifyListeners();

  }



  int retourneIndiceQuestion( String value){

    var  indice =  _listeConducteurPassager.indexWhere((innerElement) => innerElement.id == value);

return indice ;
  }

  List<Option> _listeDeChoix= [
   Option('cp_o1' , 'Oui' , ' Non, je dois être titulaire d’un permis de conduire catégorie C	 ' , 'Non, je dois être titulaire d’un permis de conduire catégorie C ou D' ) ,
    Option( 'cp_o2' , '5 places passagers' , ' 8 places passagers  ' , ' 18 places passagers' ) ,
    Option( 'cp_o3' , '40 cm  ' , ' 45 cm' , ' 60 cm	' ) ,



  ] ;
  List<Question> _listeConducteurPassager = [
    Question.Q1('cp_q1' ,'Je peux conduire un véhicule affecté au transport de choses d’une MMA de 6 tonnes, avec un permis de conduire catégorie B '
          , true , false , false , false ,
        'Pour conduire un véhicule affecté au transport de choses dont la MMA '
            'dépasse 3500 kg, vous devez être titulaire d’un permis de conduire catégorie C. Ni le permis B ni le permis D ne sont valables.' , 1 ),


    Question.Q1('cp_q2', 'Un permis de conduire valable pour la catégorie B permet de conduire un véhicule affecté au transport de personnes comprenant maximum'
        , false , true , false , false, 'Maximum 8 places non compris le siège du conducteur. Sinon , '
            'vous devez être titulaire d’un permis de conduire catégorie D.' ,1),


    Question.Q1('cp_q3','L’espace latéral minimal pour le passager d’une place avant d’un véhicule automobile est de'
        , true , false , false , true,'Chaque passager prenant place à l’avant d’un véhicule doit disposer d’une largeur minimale de 40 cm.'
            ' Le chauffeur doit quant à lui, disposer de 55 cm minimum.' ,5 ) ,

  ] ;


  String getIdQuestion () {
    return _listeConducteurPassager[_numeroQuestion].id;
  }

  String getIdOption () {
    return _listeDeChoix[_numeroChoix].id;
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
    return _listeConducteurPassager[_numeroQuestion].questionText;
  }

  bool getBonneReponseA() {

    return _listeConducteurPassager[_numeroQuestion].reponse_A;
  }
  bool getBonneReponseB() {


    return _listeConducteurPassager[_numeroQuestion].reponse_B;
  }
  bool getBonneReponseC() {


    return _listeConducteurPassager[_numeroQuestion].reponse_C;
  }


  bool getFauteGrave() {


    return _listeConducteurPassager[_numeroQuestion].fauteGrave;
  }

  String getExplication() {

    return _listeConducteurPassager[_numeroQuestion].explication;
  }

  int getPoint() {


    return _listeConducteurPassager[_numeroQuestion].point;
  }





  void questionSuivante() {
    if (_numeroQuestion <= _listeConducteurPassager.length - 1) {
      _numeroQuestion++;
    }
  }

  void optionSuivante() {
    if (_numeroChoix <= _listeDeChoix.length - 1) {
      _numeroChoix++;
    }
  }

  bool FinTheme() {
    if (_numeroQuestion >= _listeConducteurPassager.length - 1) {

       return true;

    } else {
      return false;
    }
  }

  void reset() {
    _numeroQuestion = 0;
    _numeroChoix = 0 ;
  }



}

