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

    print('    _numeroQuestion') ;

    print(_numeroQuestion) ;

    notifyListeners();

  }

   List<Option> _listeDeChoix = [
     Option('Un accotement en saillie', ' Un accotement de plain pied',
         'Une piste cyclable'),
     Option('La voie publique', ' La chaussée', 'La bande de circulation'),
     Option('Oui', ' Non', ' Non c’est une piste cyclable'),

   ] ;

   List<Question> _listeDefinition = [
     Question(
         ' Cette partie est : ',
         false,
         false,
         true,
         false,
         ' Une piste Cyclable ',
         1),

     Question(
         'Cette partie est : ',
         true,
         false,
         false,
         false,
         ' La voie publique',
         1),

     Question(
         'Cette bande rouge fait partie de la chaussée',
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






   List listeQuestionDefinition() {
     return _listeDefinition;
   }

   List listeOptionDefinition() {
     return _listeDeChoix;
   }

   int getTaille() {
     return _listeDefinition.length;
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








/*
  String serireCommencer() {
    Utility.instance.getIntegerValue(cleNumQ)
        .then((value) =>
        setState(() {
          _numeroQuestion = value;
        }));


    Utility.instance.getIntegerValue(cleNumC)
        .then((value) =>
        setState(() {
          _numeroChoix = value;
        }));


    if (_numeroQuestion == null) {
      setState(() {
        _numeroQuestion = 0;
      });

      Utility.instance
          .setIntegerValue(cleNumQ, _numeroQuestion);

      return 'oui';
    } else if (_numeroQuestion > 0) {
      return 'non';
    }

    else if (_numeroQuestion >= _listeDefinition.length - 1) {
      return 'fin';
    }
  }
*/



