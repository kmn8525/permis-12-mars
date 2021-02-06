import 'Option.dart';
import 'Question.dart';

class Feux {
  int _nombreDeQuestion = 0;
  int _nombreDeChoix = 0;

  List<Question> _listeFeux = [
    Question('Je peux franchir le feu jaune-orange fixe si, au moment où il s allume' , false , true , false , 'non', ' Vous ne pouvez pas rouler trop vite., et vous devez prévoir la succession des feux. Le feu jaune-orange fixe ne peut être franchi que, si au moment où il s allume, vous en êtes trop proche pour vous arrêter dans des conditions de sécurité suffisantes. Abordez un feu vert avec MEFIANCE, non avec confiance') ,
    Question('Le feu est rouge. Je m immobilise' , false , true , null , 'non', 'La ligne transversale est une ligne d '
        'arrêt. Elle vous indique l endroit où vous devez vous immobiliser pour un feu ou un « Stop ».' ),


  ] ;
  List<Option> _listeDeChoix= [
    Option( 'Je roule trop vite' , 'J en suis trop proche' , 'Je suis surpris' ) ,
    Option( 'A hauteur du feu' , 'A la ligne transversale' , 'null' ) ,


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


  String getFauteGrave() {


    return _listeFeux[_nombreDeQuestion].fauteGrave;
  }

  String getExplication() {

    return _listeFeux[_nombreDeQuestion].explication;
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

