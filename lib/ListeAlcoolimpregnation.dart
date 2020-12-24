import 'Option.dart';
import 'Question.dart';

class AlcoolImpregnation {
  int _nombreDeQuestion = 0;
  int _nombreDeChoix = 0;



  List<Question> _listeConducteurPassager = [
  Question(' A partir de quel taux d alcool dans l air alvéolaire expiré est-on punissable ?'
   , true , false , false , 'non', 'A partir de 0,22 milligramme d alcool par litre d air alvéolaire expiré, vous êtes déjà imprégné au premier degré, et vous êtes déjà punissable. Notez qu a partir de 0,35 mg / litre, vous êtes imprégné au deuxième degré, et les peines seront plus sévères' ),

  Question('Peut-on imposer le test d haleine a celui qui s apprête à conduire ?' , true , false , null , 'non', 'Même s il ne conduit pas encore, on peut lui imposer le test de l haleine. Dans ce cas cependant la mesure est purement préventive, et il ne risque pas d amende, sauf s il refuse le test' ),

  ] ;


  List<Reponse> _listeDeChoix= [

    Reponse( '0,22 mg par litre' , ' 	0,35 mg par litre' , '0,50 mg par litre	' ) ,
    Reponse( 'oui  ' ,' non' , 'null' ) ,

  ] ;


  String getOptionA() {
    return _listeDeChoix[_nombreDeChoix].option_A;
  }
  String getOptionB() {
    return _listeDeChoix[_nombreDeChoix].option_B;
  }
  String getOptionC() {
    return _listeDeChoix[_nombreDeChoix].option_C;
  }


  String getQuestionText() {
    return _listeConducteurPassager[_nombreDeQuestion].questionText;
  }

  bool getBonneReponseA() {

    return _listeConducteurPassager[_nombreDeQuestion].reponse_A;
  }
  bool getBonneReponseB() {


    return _listeConducteurPassager[_nombreDeQuestion].reponse_B;
  }
  bool getBonneReponseC() {


    return _listeConducteurPassager[_nombreDeQuestion].reponse_C;
  }


  String getFauteGrave() {


    return _listeConducteurPassager[_nombreDeQuestion].fauteGrave;
  }

  String getExplication() {

    return _listeConducteurPassager[_nombreDeQuestion].explication;
  }




  void questionSuivante() {
    if (_nombreDeQuestion <= _listeConducteurPassager.length - 1) {
      _nombreDeQuestion++;
    }
  }

  void optionSuivante() {
    if (_nombreDeChoix <= _listeDeChoix.length - 1) {
      _nombreDeChoix++;
    }
  }

  bool estFini() {
    if (_nombreDeQuestion >= _listeConducteurPassager.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _nombreDeQuestion = 0;
    _nombreDeChoix = 0 ;
  }



}

