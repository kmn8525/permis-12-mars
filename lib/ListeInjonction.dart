import 'Option.dart';
import 'Question.dart';

class Incjontion {
  int _nombreDeQuestion = 0;
  int _nombreDeChoix = 0;

  List<Option> _listeDeChoix= [
    Option( 'i_o1', 'Oui' , 'Non' , 'null' ) ,
    Option( 'i_o2', 'Je peux passer' , 'Je dois m'
        'arrêter' , 'null' ) ,



  ] ;
  List<Question> _listeInjonction = [
    Question.Q1('i_q1','Je peux continuer tout droit' , true , false , null , false, 'Cette injonction est équivalente au feu vert l’agent ouvre le carrefour' , 1) ,
    Question.Q1('i_q2','Je désire continuer tout droit' , true , false , null , true, 'Cette injonction est équivalente au feu rouge' , 5  ),


  ] ;


  String getIdQuestionFeux() {
    return _listeInjonction[_nombreDeQuestion].id;
  }

  String getIdOptionFeux() {
    return _listeDeChoix[_nombreDeChoix].id;
  }



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
    return _listeInjonction[_nombreDeQuestion].questionText;
  }

  bool getBonneReponseA() {

    return _listeInjonction[_nombreDeQuestion].reponse_A;
  }
  bool getBonneReponseB() {


    return _listeInjonction[_nombreDeQuestion].reponse_B;
  }
  bool getBonneReponseC() {


    return _listeInjonction[_nombreDeQuestion].reponse_C;
  }


  bool getFauteGrave() {


    return _listeInjonction[_nombreDeQuestion].fauteGrave;
  }


  int getPoint() {


    return _listeInjonction[_nombreDeQuestion].point;
  }

  String getExplication() {

    return _listeInjonction[_nombreDeQuestion].explication;
  }




  void questionSuivante() {
    if (_nombreDeQuestion <= _listeInjonction.length - 1) {
      _nombreDeQuestion++;
    }
  }

  void optionSuivante() {
    if (_nombreDeChoix <= _listeDeChoix.length - 1) {
      _nombreDeChoix++;
    }
  }

  bool estFini() {
    if (_nombreDeQuestion >= _listeInjonction.length - 1) {

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

