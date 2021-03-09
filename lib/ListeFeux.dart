import 'Option.dart';
import 'Question.dart';

class Feux {
  int _nombreDeQuestion = 0;
  int _nombreDeChoix = 0;

  List<Question> _listeFeux = [
    Question.Q1('f_q1','Je peux franchir le feu jaune-orange fixe si, au moment où il s’allume' ,
        false , true , false , true,
        ' Vous ne pouvez pas rouler trop vite., et vous devez prévoir la succession des feux. '
            'Le feu jaune-orange fixe ne peut être franchi que, '
            'si au moment où il s allume, vous en êtes trop'
            ' proche pour vous arrêter dans des conditions de'
            ' sécurité suffisantes. Abordez un feu vert avec MEFIANCE, non avec confiance' , 5) ,

    Question.Q1('f_q2' , 'Le feu est rouge. Je m’immobilise' , false , true , null , false,
        'La ligne transversale est une ligne d’arrêt Elle vous indique l’endroit où vous devez vous immobiliser pour un feu ou un « Stop ».' , 1 ),


  ] ;
  List<Option> _listeDeChoix= [
    Option( 'f_o1' , 'Je roule trop vite' , 'J’en suis trop proche' , 'Je suis surpris' ) ,
    Option( 'f_o1' , 'A hauteur du feu' , 'A la ligne transversale' , 'null' ) ,


  ] ;


  String getIdQuestion () {
    return _listeFeux[_nombreDeQuestion].id;
  }

  String getIdOption() {
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
    return _listeFeux[_nombreDeQuestion].questionText;
  }

  bool getBonneReponseA() {

    return _listeFeux[_nombreDeQuestion].reponse_A;
  }
  bool getBonneReponseB() {


    return _listeFeux[_nombreDeQuestion].reponse_B;
  }
  bool getBonneReponseC() {


    return _listeFeux[_nombreDeQuestion].reponse_C;
  }


  bool getFauteGrave() {


    return _listeFeux[_nombreDeQuestion].fauteGrave;
  }

  String getExplication() {

    return _listeFeux[_nombreDeQuestion].explication;
  }

  int getPoint() {


    return _listeFeux[_nombreDeQuestion].point;
  }




  void questionSuivante() {
    if (_nombreDeQuestion <= _listeFeux.length - 1) {
      _nombreDeQuestion++;
    }
  }

  void optionSuivante() {
    if (_nombreDeChoix <= _listeDeChoix.length - 1) {
      _nombreDeChoix++;
    }
  }

  bool estFini() {
    if (_nombreDeQuestion >= _listeFeux.length - 1) {

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

