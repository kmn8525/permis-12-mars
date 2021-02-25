import 'Option.dart';
import 'Question.dart';

class ConducteurPassager {
  int _nombreDeQuestion = 0;
  int _nombreDeChoix = 0;

  List<Option> _listeDeChoix= [
   Option( 'Oui' , ' Non, je dois être titulaire d’un permis de conduire catégorie C	 ' , 'Non, je dois être titulaire d’un permis de conduire catégorie C ou D' ) ,
    Option( '5 places passagers' , ' 8 places passagers  ' , ' 18 places passagers' ) ,
    Option( '40 cm  ' , ' 45 cm' , ' 60 cm	' ) ,



  ] ;
  List<Question> _listeConducteurPassager = [
    Question('Je peux conduire un véhicule affecté au transport de choses d’une MMA de 6 tonnes, avec un permis de conduire catégorie B '
          , true , false , false , false ,
        'Pour conduire un véhicule affecté au transport de choses dont la MMA '
            'dépasse 3500 kg, vous devez être titulaire d’un permis de conduire catégorie C. Ni le permis B ni le permis D ne sont valables.' , 1 ),


    Question('Un permis de conduire valable pour la catégorie B permet de conduire un véhicule affecté au transport de personnes comprenant maximum'
        , false , true , false , false, 'Maximum 8 places non compris le siège du conducteur. Sinon , '
            'vous devez être titulaire d’un permis de conduire catégorie D.' ,1),


    Question('L’espace latéral minimal pour le passager d’une place avant d’un véhicule automobile est de'
        , true , false , false , true,'Chaque passager prenant place à l’avant d’un véhicule doit disposer d’une largeur minimale de 40 cm.'
            ' Le chauffeur doit quant à lui, disposer de 55 cm minimum.' ,5 ) ,



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


  bool getFauteGrave() {


    return _listeConducteurPassager[_nombreDeQuestion].fauteGrave;
  }

  String getExplication() {

    return _listeConducteurPassager[_nombreDeQuestion].explication;
  }

  int getPoint() {


    return _listeConducteurPassager[_nombreDeQuestion].point;
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

