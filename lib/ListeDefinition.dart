import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Option.dart';
import 'Question.dart';

 class Definition    with  ChangeNotifier , DiagnosticableTreeMixin {


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

    // ignore: non_constant_identifier_names
    Definition.C1(int a) {
     _numeroQuestion = a ;
     _numeroChoix = a ;
    }

   Definition.C2( );

   void   SetNumQueOpt( int value ) {


    print('dans sauvegarder value') ;

    print(value) ;

    _numeroQuestion = value ;
    _numeroChoix = value ;

    print('  _numeroQuestion') ;

    print(_numeroQuestion) ;

    notifyListeners();

  }

   List<Option> _listeDeChoix = [
     Option('d_o1' ,'Un accotement en saillie', ' Un accotement de plain pied',
         'Une piste cyclable'),
     Option('d_o2','La voie publique', ' La chaussée', 'La bande de circulation'),
     Option('d_o3', 'Oui', ' Non', ' Non c’est une piste cyclable'),

   ] ;

   List<Question> _listeDefinition = [
     Question.Q1(
        'd_q1' , ' Cette partie est : ',
         false,
         false,
         true,
         false,
         ' Une piste Cyclable ',
         1),

     Question.Q1(
         'd_q2' , 'Cette partie est : ',
         true,
         false,
         false,
         false,
         ' La voie publique',
         1),

     Question.Q1(
         'd_q3'  , 'Cette bande rouge fait partie de la chaussée',
         true,
         false,
         false,
         false,
         ' On parle parfois de piste cyclable suggérée',
         1),


   ];

   String get getCleNumQueDef =>  cleNumQD ;

   int get getNumQueDef =>  _numeroQuestion ;
   int get getNumChoDef =>  _numeroChoix ;

int ver(){






    var i =  _listeDefinition.indexWhere((innerElement) => innerElement.id =='d_q1');
   print('---------------i  i i ------------') ;
  print(i) ;



}

 

   String getIdQuestion() {
     return _listeDefinition[_numeroChoix].id;
   }

   String getIdOption() {
     return _listeDeChoix[_numeroChoix].id;
   }

   String getOptionA() {
     return _listeDeChoix[_numeroChoix].option_A;
   }
   List listeQuestionDefinition() {
     return _listeDefinition;
   }

   List listeOptionDefinition() {
     return _listeDeChoix;
   }

   int getTaille() {
     return _listeDefinition.length;
   }


   String getOptionB() {
     return _listeDeChoix[_numeroChoix].option_B;
   }

   String getOptionC() {
     return _listeDeChoix[_numeroChoix].option_C;
   }


   String getQuestionText() {
     return _listeDefinition[_numeroQuestion].questionText;
   }

   bool getBonneReponseA() {
     return _listeDefinition[_numeroQuestion].reponse_A;
   }

   bool getBonneReponseB() {
     return _listeDefinition[_numeroQuestion].reponse_B;
   }

   bool getBonneReponseC() {
     return _listeDefinition[_numeroQuestion].reponse_C;
   }


   bool getFauteGrave() {
     return _listeDefinition[_numeroQuestion].fauteGrave;
   }

   String getExplication() {
     return _listeDefinition[_numeroQuestion].explication;
   }

   int getPoint() {
     return _listeDefinition[_numeroQuestion].point;
   }

   void questionSuivante() {
     if (_numeroQuestion <= _listeDefinition.length - 1) {
       _numeroQuestion++;
     }
   }

     void optionSuivante() {
       if (_numeroChoix <= _listeDeChoix.length - 1) {
         _numeroChoix++;
       }
     }

     bool FinTheme() {
       if (_numeroQuestion >= _listeDefinition.length - 1) {
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












