import 'Option.dart';
import 'Question.dart';

class ConducteurPassager {
  int _nombreDeQuestion = 0;
  int _nombreDeChoix = 0;

  List<Reponse> _listeDeChoix= [
   Reponse( 'Oui' , ' Non, je dois être titulaire d un permis de conduire catégorie C	 /R ' , 'Non, je dois être titulaire d un permis de conduire catégorie C ou D' ) ,
    Reponse( '5 places passagers' , ' 8 places passagers / R ' , ' 18 places passagers' ) ,
    Reponse( '40 cm / R' , ' 45 cm' , ' 60 cm	' ) ,
    Reponse( 'La hauteur de mon véhicule' , ' 2 mètres /R' , ' 5 mètres	' ) ,
    Reponse( 'Je le fais dépasser de 2 mètres vers l arrière /R	' , ' Je le fais dépasser d un mètre vers l avant et d un mètre vers l arrière' , ' Je ne peux pas le transporter	' ) ,
    Reponse( 'Oui' , 'Non' , 'null' ) ,



  ] ;
  List<Question> _listeConducteurPassager = [
    Question('Je peux conduire un véhicule affecté au transport de choses d une MMA de 6 tonnes, avec '
        'un permis de conduire catégorie B' , true , false , false , 'non', 'Pour conduire un véhicule affecté au transport de choses dont la MMA dépasse 3500 kg, vous devez être titulaire d un permis de conduire catégorie C. Ni le permis B ni le permis D ne sont valables.' ),


    Question('Un permis de conduire valable pour la catégorie B permet de conduire un véhicule affecté au transport de personnes comprenant maximum ' , false , true , false , 'non', 'Maximum 8 places non compris le siège du conducteur. Sinon, vous devez être titulaire d un permis de conduire catégorie D.' ),


    Question('L espace latéral minimal pour le passager d une place avant d un véhicule automobile est de' , true , false , false , 'oui','Chaque passager prenant place à l avant d un véhicule doit disposer d une largeur minimale de 40 cm. Le chauffeur doit quant à lui, disposer de 55 cm minimum.'  ) ,

    Question('La hauteur de mon chargement ne peut excéder' , false , true , false , 'non' ,'Chiffre à retenir: A mètres. Ceci est valable tant pour les voitures que pour les camions ou les autocars.' ) ,

    Question( 'Je désire transporter un tuyau dont la longueur excède de 2 mètres la longueur de véhicule	mon' , true , false , false , 'non' ,'Le chargement ne peut pas dépasser l avant du véhicule. Par contre, il peut dépasser l arrière de 3 mètres maximum.' ) ,

    Question('Une roue de secours et un cric doivent se trouver à bord de mon véhicule' , false , true , null , 'non', 'Fortement conseille mais non obligatoire')
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

