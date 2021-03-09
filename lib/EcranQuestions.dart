import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permis/Acceuil.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Dessiner.dart';
import 'EcranSolutions.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'ListeFavoris.dart';
import 'ListeFeux.dart';
import 'ListeInjonction.dart';
import 'ListeResultats.dart';
import 'Utility.dart';

var listRep = [] ;

//    languages = await flutterTts.setLanguage("fr-BE");

var tampon = null ;
String chemin_image ;
String TitreTheme ;
int MoyennePoint = 0 ;

class EcranQuestions extends StatefulWidget  {

  final String titrePage;
  final int NumImage ;



    EcranQuestions({Key key , this.titrePage, this.NumImage}) : super(key: key);


  @override
  EcranQuestionsState createState() => EcranQuestionsState();


  Object chargementListesDeQuestion() {

    if (titrePage == 'DEFINITION') {
      var d = () => Definition.C1(NumImage);
      tampon = d();
      chemin_image = 'imageDefinition';

    }

    else if (titrePage == 'CONDUCTEUR') {
      {
        var c = () => ConducteurPassager();
        tampon = c();
        chemin_image = 'imageConducteurPassager';
      }
    }
    else if (titrePage == 'INJONCTIONS') {
      {
        var i = () => Incjontion();
        tampon = i();
        chemin_image = 'ImageInjonction';
      }
    }
    else if (titrePage == 'FEUX') {
      {
        var f = () => Feux();
        tampon = f();
        chemin_image = 'ImageSignaux';
      }
    }
    return tampon ;

  }
  Object chargementTitreTheme() {

    if (titrePage == 'DEFINITION') {
      TitreTheme = 'DEFINITION' ;
    }

    else if (titrePage == 'CONDUCTEUR') {
      {
        TitreTheme = 'CONDUCTEUR' ;


      }
    }
    else if (titrePage == 'INJONCTIONS') {
      {
        TitreTheme = 'INJONCTIONS' ;


      }
    }
    else if (titrePage == 'FEUX') {
      {
        TitreTheme = 'FEUX' ;

      }
    }
    return TitreTheme ;

  }

void check(){}

}

enum TtsState { playing, stopped, paused, continued }


class EcranQuestionsState extends State<EcranQuestions>  with ChangeNotifier , SingleTickerProviderStateMixin {






  String liensImage (){

    return chemin_image ;
  }

  String TitreQuestion (){

    return widget.titrePage ;
  }

  int getNumImage (){

    return widget.NumImage ;
  }




  bool verifi = false ;


  String cleNumQD = "qd";

  String cleNumCD = "cd";
  String cleNumQCO = "qco";

  String cleNumCCO = "cco";
  int numQD  = 0 ;
  int nbCD  ;
  int nbQCO  ;
  int nbQCCO  ;
  int i ;
  int numeroImage  = 0 ;
  String RcleQD=""  ;
  String IdQuestion ;
  String IdOption ;
  bool verifExisteQuestion ;

  Color couleurPardefault_A = Color(0xffffffff) ;
  Color couleurPardefault_B =  Color(0xffffffff) ;
  Color couleurPardefault_C =  Color(0xffffffff) ;
  Color couleurPardefault_bouton_Explication =  Colors.blue;
  Color couleurPardefault_Sauvegarde =  Colors.grey;



  Color couleurApresSelection_A = Colors.orange;
  Color couleurApresSelection_B = Colors.orange;
  Color couleurApresSelection_C = Colors.orange;
  Color couleurApresSelection_bouton_Explication =  Colors.blue;
  Color couleurApresSelection_bouton_Sauvegarde  =  Colors.blue;


  Color couleurAnimation = Colors.white ;

  AnimationController _animationController;
  bool animer = false ;
  int t = 2 ;
  Timer _timer;
  int _start = 4;
  bool val = false ;
  String f ;


  bool choix_1;
  bool choix_2;
  bool choix_3;
  bool valeur_choisi;
  int  point ;

  int indice  ;




  bool clic_bouton_A = false;
  bool clic_bouton_B = false;
  bool clic_bouton_C = false;
  bool clic_bouton_explication = false;
  bool clic_bouton_sauvegarde = false;
  bool clic_bouton_Volume = true;


  bool visibilite_bouton_Valider = true;
  bool visibilite_bouton_explication = false;
  bool visibilite_bouton_sauvegarde = false;

  bool visibilite_bouton_Suivant = false;
  bool visibilite_bouton_C = false;


  bool desactive_boutonA = false;
  bool desactive_boutonB = false;
  bool desactive_boutonC = false;
  bool desactive_bouton_Explication= false;
  bool desactive_bouton_Sauvegarde = false;

  String _tf = 'Aucun texte saisi';
  String _tfS = 'Aucun texte soumis';
  String _cTf = 'Aucun texte saisi';
  String _cTfS = 'Aucun texte soumis';
  String selectedCurrency = "Il y a une erreur dans le contenue";

  String dropdownValue = 'One';





  FlutterTts flutterTts;
  dynamic languages;
  //String language;
  double volume = 1.0;
  double pitch = 1.1;
  double rate = 1.0;
  String _text_parler ;


  void  StatusTheme() {

    Utility.instance.getIntegerValue(RcleQD)
        .then((value) => setState(() {
      numQD = value ;

    }));

  }






  @override
  void initState() {

   // Provider.of<Definition>(context , listen: false).sauvegarQuestion() ;


    RcleQD =  Provider.of<Definition>(context , listen: false).getCleNumQueDef ;


     widget.chargementListesDeQuestion();
    widget.chargementTitreTheme();
    verifExisteQuestion =  Provider.of<Favoris>(context , listen: false).VerificationQuestionFavoris(IdQuestion) ;

    IdQuestion =      tampon.getIdQuestion() ;

    print('IdQuestion') ;
    print(IdQuestion) ;

      Provider.of<Favoris>(context , listen: false).afficheFavoris() ;
var b =       Provider.of<Favoris>(context , listen: false).listeQuestionFavoris() ;

    numeroImage = widget.NumImage +1 ;


    Future.delayed(Duration(milliseconds: 500) * 5, () {
      if (!mounted) {
        return;
      }

      setState(() {
      });
    });


    masqueBouton( ) ;


    TitreQuestion () ;
    resetColor();
    initTts();
    _speak() ;
     visibilite_bouton_explication = false ;
    visibilite_bouton_sauvegarde = false ;
    clic_bouton_Volume = false ;



    super.initState();


  }



  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  Intro intro;


  void setNumImage (int value ) {
      numeroImage =  value ;

     notifyListeners();
  }
  Color couleurChoix = Colors.red;
  Future _getLanguages() async {
    languages = await flutterTts.setLanguage("fr-FR");
    // flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
     if (languages != null) setState(() => languages);
  }

  initTts() {
    flutterTts = FlutterTts();

    _getLanguages();

    if (isAndroid || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
           ttsState = TtsState.paused;
        });
      });
    flutterTts.setStartHandler(() {
      setState(() {
         ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
         ttsState = TtsState.stopped;
      });
    });
      flutterTts.setContinueHandler(() {
        setState(() {
           ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {


         ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_text_parler != null) {
      if (_text_parler.isNotEmpty) {
        var result = await flutterTts.speak(_text_parler);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }
  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

int getIndiceTotal()
{
  return indice ;
}

  Color verificationDesReponse(bool a, bool b, bool c) {
    bool verif_a;
    bool verif_b;
    bool verif_c;

    String tmp;

    setState(() {
      // --------------------------------------//
      // ----- ON TESTE SI TOUTES LES VALEUR NE SONT SELECTIONNER  ---- //
      // --------------------------------------//

      if ((a == null) & (b == null) & (c == null))
      {
        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();
        point  = tampon.getPoint();
        couleurChoix = Colors.red ;

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA(couleurPardefault_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB(couleurPardefault_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC(couleurPardefault_C);

         if ((verif_a == true) & (verif_b == true)) {
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.green;
        } else if ((verif_a == true) & (verif_c == true)) {
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.green;
        } else if ((verif_b == true) & (verif_c == true)) {
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.green;
        } else if (verif_a == true) {
          couleurPardefault_A = Colors.green;
        } else if (verif_b == true) {
          couleurPardefault_B = Colors.green;
        } else {
          couleurPardefault_C = Colors.green;
        }



        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurPardefault_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurPardefault_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurPardefault_C);



        Provider.of<Resultats>(context , listen: false).afficheListe();


      }

      // --------------------------------------//
// ----- ON TESTE SI TOUTE LES VALEURS  SONT SELECTIONNER ---- //
      // --------------------------------------//

      else if ((a != null) & (b != null) & (c != null))
      {

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (couleurApresSelection_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (couleurApresSelection_C);

        couleurChoix = Colors.red ;
        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();


        if ((verif_a == a) & (verif_b == b)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.red;

        } else if ((verif_a == a) & (verif_c == c)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_B = Colors.red;

        } else if ((verif_b == b) & (verif_c == c)) {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_A = Colors.red;

        } else if (verif_a == a) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_C = Colors.red;


        } else if (verif_b == b) {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurApresSelection_A = Colors.red;


        } else {
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_A = Colors.red;

        }


        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurApresSelection_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurApresSelection_C);


      }

      // --------------------------------------//
// ----- ON TESTE SI   A ET B  SONT SELECTIONNER ---- //
      // --------------------------------------//
      else if ((a != null) & (b != null) )
      {
        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();

        couleurChoix = Colors.red ;


        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (couleurApresSelection_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (Colors.white);

        if ((verif_a == a) & (verif_b == b)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.white;

          couleurChoix = Colors.green ;



        }

        else if (verif_a == a)
        {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurPardefault_C = Colors.white;



        }
        else if (verif_b == b )
        {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_A = Colors.red;
          couleurPardefault_C = Colors.white;

        }
        else
        {
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_A = Colors.red;

          couleurPardefault_C = Colors.green;

        }


        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurApresSelection_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurPardefault_C);


      }

      // --------------------------------------//
// ----- ON TESTE SI   A ET C  SONT SELECTIONNER ---- //
      // --------------------------------------//

      else if ((a != null) & (c != null) )
      {

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (couleurApresSelection_A);

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (couleurApresSelection_C);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (Colors.white);

        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();
        couleurChoix = Colors.red ;


        if ((verif_a == a) & (verif_c == c)) {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurPardefault_B = Colors.white;


          couleurChoix = Colors.green ;

        }

        else if (verif_a == a)
        {
          couleurApresSelection_A = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurPardefault_B = Colors.white;


        }
        else if (verif_c == c)
        {
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.white;

        }
        else {
          couleurPardefault_B = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurApresSelection_A = Colors.red;


        }


        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurPardefault_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurApresSelection_C);

      }

      // --------------------------------------//
// ----- ON TESTE SI   B ET C  SONT SELECTIONNER ---- //
      // --------------------------------------//
      else if ((b != null) & (c != null) )
      {

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (couleurApresSelection_B);

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (couleurApresSelection_C);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (Colors.white);

        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();
        couleurChoix = Colors.red ;


        if ((verif_b == b) & (verif_c == c)) {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.green;
          couleurPardefault_C = Colors.white;


          couleurChoix = Colors.green ;

        }

        else if (verif_b == b)
        {
          couleurApresSelection_B = Colors.green;
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.white;


        }
        else if (verif_c == c)
        {
          couleurApresSelection_C = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.white;


        }
        else {
          couleurPardefault_A = Colors.green;
          couleurApresSelection_B = Colors.red;
          couleurApresSelection_C = Colors.red;

        }


        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurPardefault_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurApresSelection_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurApresSelection_C);


      }

      // --------------------------------------//
// ----- ON SELECTIONNE A  ET   B , C SONT NULL---- //
      // --------------------------------------//

      else if ((a != null) & (b == null) & (c == null))
      {
        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();
        couleurChoix = Colors.red ;

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (Colors.white);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (Colors.white);


        if ((verif_a == a) & (verif_b == true)) {
          couleurApresSelection_A = Colors.green;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.white;

          couleurChoix = Colors.green ;

        } else if ((verif_b == true) & (verif_c == true)) {
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.green;

        } else if ((verif_a == a) & (verif_c == true)) {
          couleurApresSelection_A = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_C = Colors.green;


          couleurChoix = Colors.green ;


        } else  if (verif_a == a)  {
          couleurApresSelection_A = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_C = Colors.white;
          couleurChoix = Colors.green ;


          couleurChoix = Colors.green ;

        }
        else  if (verif_b == true)  {
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.white;

        }
        else {
          couleurApresSelection_A = Colors.red;
          couleurPardefault_B = Colors.white;
          couleurPardefault_C = Colors.green;


        }



        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurApresSelection_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurPardefault_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurPardefault_C);

      }

      // --------------------------------------//
// ----- ON  SELECTIONNE B  ET   A , C SONT NULL ---- //
      // --------------------------------------//

      else if ((b != null) & (a == null) & (c == null))
      {


        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (couleurApresSelection_B);

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (Colors.white);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (Colors.white);

        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();

        couleurChoix = Colors.red ;


        if ((verif_b == b) & (verif_a == true)) {
          couleurApresSelection_B = Colors.green;
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.white;

          couleurChoix = Colors.green ;

        } else if ((verif_b == true) & (verif_c == true)) {
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.green;
        } else if ((verif_b == b) & (verif_c == true)) {
          couleurApresSelection_B = Colors.green;
          couleurPardefault_A = Colors.white;
          couleurPardefault_C = Colors.green;

          couleurChoix = Colors.green ;

        }  else  if (verif_b == b)  {
          couleurApresSelection_B = Colors.green;
          couleurPardefault_B = Colors.green;
          couleurPardefault_C = Colors.white;


          couleurChoix = Colors.green ;

        }
        else  if (verif_a == true)  {
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_C = Colors.white;
        }
        else {
          couleurApresSelection_B = Colors.red;
          couleurPardefault_A = Colors.white;
          couleurPardefault_C = Colors.green;

        }

        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurPardefault_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurApresSelection_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurPardefault_C);


      }
      // --------------------------------------//
// ----- ON  SELECTIONNE C  ET   A , B SONT NULL---- //
      // --------------------------------------//

      else if ((c != null) & (a == null) & (b == null))
      {
        verif_a = tampon.getBonneReponseA();
        verif_b = tampon.getBonneReponseB();
        verif_c = tampon.getBonneReponseC();

        couleurChoix = Colors.red ;

        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionC (couleurApresSelection_C);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionB (Colors.white);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurSelectionA (Colors.white);



        if ((verif_c == c) & (verif_a == true)) {
          couleurApresSelection_C = Colors.green;
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.white;

          couleurChoix = Colors.green ;

        } else if ((verif_b == true) & (verif_a == true)) {
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.green;
        } else if ((verif_c == c) & (verif_a == true)) {
          couleurApresSelection_C = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_A = Colors.green;

          couleurChoix = Colors.green ;

        }  else  if (verif_c == c)  {
          couleurApresSelection_C = Colors.green;
          couleurPardefault_B = Colors.white;
          couleurPardefault_A = Colors.white;

          couleurChoix = Colors.green ;

        }
        else  if (verif_a == true)  {
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.green;
          couleurPardefault_B = Colors.white;
        }
        else {
          couleurApresSelection_C = Colors.red;
          couleurPardefault_A = Colors.white;
          couleurPardefault_B = Colors.green;

        }

        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonA(couleurPardefault_A);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonB(couleurPardefault_B);
        Provider.of<Resultats>(context , listen: false).ajouterColoueurBoutonC(couleurApresSelection_C);


      }

    });





    return couleurChoix ;
  }

// ----- REINITIALISATION DES COULEUR APRES LA PROCHAINE QUESTION ---- //

  void resetColor() {
    setState(() {
      couleurPardefault_B = Colors.white;
      couleurPardefault_A = Colors.white;
      couleurPardefault_C = Colors.white;

      couleurApresSelection_A = Colors.orange;
      couleurApresSelection_B = Colors.orange;
      couleurApresSelection_C = Colors.orange;
    });
  }

  void BoutonSuivant() {


    resetColor();
    setState(() {

      if (tampon.FinTheme() == true) {

         _stop();

         Utility.instance
             .setIntegerValue(RcleQD, 0);

         var alertStyle = AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          descTextAlign: TextAlign.start,
          animationDuration: Duration(milliseconds: 500),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.green,
          ),
          alertAlignment: Alignment.center,
        );
        Alert(
          context: context,
          style: alertStyle,
          image: SvgPicture.asset(
            'assets/emoji/happy.svg',
            height: 43.0,
            width: 43.0,
            allowDrawingOutsideViewBox: true,
          ),
          // type: AlertType.info,
          title: "FIN DE LA SERIE",

          // desc: "Voulez-vous continuez ?.",

          buttons: [

            DialogButton(
              //  margin: EdgeInsets.all(15),

                child: Text(
                  "RECOMMENCER",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                color: Color.fromRGBO(0, 179, 134, 1.0),

                onPressed: ()
                {
                  Provider.of<Resultats>(context , listen: false).SuprimerLesResultat();

                  Provider.of<Resultats>(context , listen: false).reset();

                  Navigator.pop(context);
                  resetColor();

                  // REINITIALISATION DE LA LISTE

                  tampon.reset();

                  // lire les texte apres avoir reset
                  masqueBouton();

                  visibilite_bouton_Valider = !visibilite_bouton_Valider; // le bouton valider est desactiver
                  visibilite_bouton_Suivant = !visibilite_bouton_Suivant; // le bouton suivant est afficher
                  desactive_boutonA = !desactive_boutonA;
                  desactive_boutonB = !desactive_boutonB;
                  desactive_boutonC = !desactive_boutonC;

                  clic_bouton_A = false;
                  clic_bouton_B = false;
                  clic_bouton_C = false;


                }
            ),

            DialogButton(
              margin: EdgeInsets.all(15),

              child: Text(

                "ACCEUIL",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {
_stop();
Provider.of<Resultats>(context , listen: false).SuprimerLesResultat();

Provider.of<Resultats>(context , listen: false).reset();

                Navigator.of(context, rootNavigator: false ).push(MaterialPageRoute(
                    builder: (BuildContext context  ) => Accueil( )));



              },


              color: Colors.deepOrangeAccent,

            ) ,

            DialogButton(
            //  padding: EdgeInsets.all(15),

              child: Text(
                "CORRECTION",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),


              onPressed:  () {

                _stop();
                Navigator.of(context, rootNavigator: false ).push(MaterialPageRoute(
                    builder: (BuildContext context  ) =>
                        EcranSolutions(TitreTheme: '${TitreTheme}' )));

               },

              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )

          ],



        ).show();
        numeroImage = 1;

      }
      else {

        visibilite_bouton_Valider = !visibilite_bouton_Valider; // le bouton valider est desactiver
        visibilite_bouton_Suivant = !visibilite_bouton_Suivant; // le bouton suivant est afficher
        desactive_boutonA = !desactive_boutonA;
        desactive_boutonB = !desactive_boutonB;
        desactive_boutonC = !desactive_boutonC;

        clic_bouton_A = false;
        clic_bouton_B = false;
        clic_bouton_C = false;

        tampon.questionSuivante();
        tampon.optionSuivante();
        numeroImage++;


        masqueBouton( ) ;
        resetColor();



      }

    });


  }

  void BoutonValider() {




    setState(() {
      choix_1 = null;
      choix_2 = null;
      choix_3 = null;


      visibilite_bouton_Valider = !visibilite_bouton_Valider;
      visibilite_bouton_Suivant = !visibilite_bouton_Suivant;


    });


  }

  void _aChoisi(int value) {
  }

  bool valeurChoisiA() {
    if (clic_bouton_A == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  bool valeurChoisiB() {
    if (clic_bouton_B == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  bool valeurChoisiC() {
    if (clic_bouton_C == true) {
      valeur_choisi = true;
    } else {
      valeur_choisi = null;
    }

    return valeur_choisi;
  }

  void masqueBouton( ) {

    setState(() {

      if (  tampon.getOptionC()   == 'null' ) {

        visibilite_bouton_C = false ;

        _text_parler  = tampon.getQuestionText() +  ":" + "," + tampon.getOptionA() + " , Reponse A ,  "  + tampon.getOptionB() + " , Reponse B , "   ;

         _speak();

      }


      else {
        visibilite_bouton_C = true ;
        _text_parler  = tampon.getQuestionText()  + "," +tampon.getOptionA() + " ,  Reponse A , " +  tampon.getOptionB() + " , Reponse B , " +  tampon.getOptionC()+ " , Reponse C ";
print(_text_parler);
         _speak();


      }


    });



  }


  EcranQuestionsState () {
    intro = Intro(
      stepCount: 3,

      /// use defaultTheme, or you can implement widgetBuilder function yourself
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        texts: [
          '',
          '',
          '',
         ],
        buttonTextBuilder: (currPage, totalPage) {
           return currPage < totalPage - 1 ? 'suivant' : 'fin';
        },
      ),

    );


  }


  var IconSongAlumer =   Icon(
    Icons.volume_up,
    color: Colors.black ,
    size: 20,
  );
  var IconSongEteind = Icon(
    Icons.volume_mute,
    color: Colors.black ,
    size: 20,
  );




  static const List<String> currenciesList = <String>[
    'Il y a une erreur dans le contenue',
    'Autre',
    'Probleme image',
  ];
  Widget materialTextField() {

    return  Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Saisissez ce que vous voulez !',
        ),
        onChanged: (value) {
          setState(() {
            _tf = value;
          });
        },
        onSubmitted: (value) {
          setState(() {
            _tfS = value;
          });
        },
      ),
    );

  }

  Widget cupertinoTextField() {

    return   Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: CupertinoTextField(
        placeholder: 'Saisissez ce que vous voulez !',
        onChanged: (value) {
          setState(() {
            _cTf = value;
          });
        },
        onSubmitted: (value) {
          setState(() {
            _cTfS = value;
          });
        },
      ),
    );

  }


  Widget EcranFormulaireTextField(BuildContext context) {

          return Platform.isIOS ? cupertinoTextField() : materialTextField();

  }


  Widget EcranFormulairePicker(BuildContext context) {

    return Platform.isIOS ? iOSPicker() : androidDropdown(context);

  }
  String newValue ;

    @override
    Widget androidDropdown(BuildContext context) {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (  newValue) {
           setState(() {

            dropdownValue =  newValue;


          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
  }



  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
         });
      },
      children: pickerItems,
    );
  }


  Widget BoutonPlayStop(BuildContext context) {

    return  GestureDetector(
      child: SizedBox(
        width: 70,
        height: 70 ,

        child: Row(
          children: [
            Visibility(
              visible: visibilite_bouton_Valider,

              child: Expanded(
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 0, 1, 0),

                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () {

                    Color CouleurAchoisi =  verificationDesReponse(choix_1, choix_2, choix_3);

                    Provider.of<Resultats>(context , listen: false).ajouterCouleurResultats(CouleurAchoisi);

                    Utility.instance
                        .setIntegerValue(RcleQD, tampon.getNumQueDef);


                    BoutonValider();

                    /*print(' 3 --- text parler dans le PLAY -----') ;
                    print(_text_parler);*/

                    _stop();
                    setState(() {
                      visibilite_bouton_explication = true ;
                        visibilite_bouton_sauvegarde = true ;

                    });

                    IdQuestion =      tampon.getIdQuestion() ;

                    verifExisteQuestion =  Provider.of<Favoris>(context , listen: false).VerificationQuestionFavoris(IdQuestion) ;



                    String idQuestion = tampon.getIdQuestion();
                    String q = tampon.getQuestionText();
                    bool g = tampon.getFauteGrave() ;
                    String e = tampon.getExplication();

                    String optionA = tampon.getOptionA() ;

                    String idChoix = tampon.getOptionA() ;
                    String optionB = tampon.getOptionB();
                    String optionC = tampon.getOptionC();

                    Provider.of<Resultats>(context , listen: false).ajouterQuestion(idQuestion , q , choix_1 , choix_2, choix_3, g , e , point);
                    Provider.of<Resultats>(context , listen: false).ajouterReponse(idChoix ,optionA, optionB, optionC);

                    setState(() {
                      desactive_boutonA = !desactive_boutonA;
                      desactive_boutonB = !desactive_boutonB;
                      desactive_boutonC = !desactive_boutonC;
                    });
                  },
                ),


              ),

            ),
            Visibility(
              visible: visibilite_bouton_Suivant,
              child: Expanded(
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.black,
                    size: 30.0,

                  ),
                  onPressed: () {

                    setState(() {
                      clic_bouton_Volume = false ;
                      visibilite_bouton_explication = false ;
                      visibilite_bouton_sauvegarde = false ;


                    });
                    BoutonSuivant();

                    /* print('4 --- text parler dans le NEXT -- ---') ;
                    print(_text_parler);*/



                  },
                  // color: Colors.blueAccent,
                ),

              ),
            ),
          ],
        ),


      ),


    );

  }



  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;
    //StatutFavoris() ;
StatusTheme() ;
    return Scaffold(
      extendBody: true,

      appBar: AppBar(

        leading:   IconButton(
  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  icon:   Icon(
              Icons.arrow_back,
              color: Colors.blueAccent ,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: false ).push(MaterialPageRoute(
                builder: (BuildContext context  ) => Accueil( )));

            _stop() ;
          }
        ),
        title: Row(
          children: <Widget> [

            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(widget.titrePage)


            ),

            IconButton(
              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                color:
                clic_bouton_C ? couleurApresSelection_C : couleurPardefault_C,

                icon: clic_bouton_Volume ? IconSongEteind : IconSongAlumer ,                  // color: currentIndex == 1 ? Colors.orange : Colors.grey.shade400,

                onPressed: () {
                setState(() {
                  clic_bouton_Volume = !clic_bouton_Volume;

                });

                if ( clic_bouton_Volume == false ) {
                  _speak() ;

                }
                else {
                  _stop() ;
                }


                }),

            IconButton(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                icon: Icon(
                  Icons.bug_report,
                  // color: currentIndex == 1 ? Colors.orange : Colors.grey.shade400,
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  child:  EcranFormulaireTextField(context ),
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

                                ),
                                Container(

                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

                                    child: EcranFormulairePicker(context)
                                ) ,

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );

                 }),

          ],
        ),
      ),
      body: Container(

       /* decoration: BoxDecoration(
          gradient: RadialGradient(
              radius: 1,
              color: [Colors.white, kCouleurBody]
          ),
        ),*/
        height: hauteur,
        child: Stack(
          children: <Widget>[
                 Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: Image.asset(
                                'assets/$chemin_image/$numeroImage.jpg',
                                height: 270,
                              ),
                            ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: [
                          Text(
                            tampon.getQuestionText()    ,

                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB( 0, 0, 0, 50),

                      child: Column(
                        children: <Widget>[
                          Wrap(
                            // spacing: 2,
                            runSpacing: -70,
                            children: <Widget>[

                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  1  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 40, 30, 50),

                                      child: Container(
                                         child: AbsorbPointer(
                                          absorbing: desactive_boutonA,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              // side: BorderSide(color: Colors.red)
                                            ),
                                            elevation: 3,
                                            textColor: Colors.black,
                                            child: Text(
                                              tampon.getOptionA(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                clic_bouton_A = !clic_bouton_A;
                                              });

                                              choix_1 = valeurChoisiA();



                                            },
                                            color: clic_bouton_A
                                                ? couleurApresSelection_A
                                                : couleurPardefault_A,
                                          ),
                                        ),
                                        height: 50.0,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),

                                    child: Container(
                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonA,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
                                          textColor: Colors.black,
                                          child: Text(
                                            'A',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              clic_bouton_A = !clic_bouton_A;
                                            });


                                            choix_1 = valeurChoisiA();

                                          },
                                          color: clic_bouton_A
                                              ? couleurApresSelection_A
                                              : couleurPardefault_A,

                                        ),
                                      ),
                                      height: 45.0,
                                      width: 45,
                                    ),
                                  ),
                                ],
                              ),


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  2  -------------- /////////
                              /////////////////////////////////////////////////////////////////////
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      //margin: EdgeInsets.all(40),
                                    //  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),

                                      margin: EdgeInsets.fromLTRB(20, 40, 30, 50),
                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonB,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
                                          textColor: Colors.black,
                                          child: Text(
                                            tampon.getOptionB(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              clic_bouton_B = !clic_bouton_B;
                                            });


                                            choix_2 = valeurChoisiB();
                                          },
                                          color: clic_bouton_B ? couleurApresSelection_B : couleurPardefault_B,
                                        ),
                                      ),
                                      height: 50.0,
                                      width: 250,
                                    ),
                                  ),
                                  Container(
                                   // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(

                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonB,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
                                          textColor: Colors.black,
                                          child: Center(
                                            child: Text(
                                              'B',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              clic_bouton_B = !clic_bouton_B;
                                            });

                                            choix_2 = valeurChoisiB();
                                          },
                                          color: clic_bouton_B ? couleurApresSelection_B : couleurPardefault_B,
                                        ),
                                      ),
                                      height: 45.0,
                                      width: 45,
                                    ),
                                  ),
                                ],
                              ),


                              /////////////////////////////////////////////////////////////////////
                              ///// ---------------   BOUTON  3  -------------- /////////
                              /////////////////////////////////////////////////////////////////////

                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 40, 30, 50),

                                      child: Visibility(
                                        visible: visibilite_bouton_C,
                                        child: Container(
                                           child: AbsorbPointer(
                                            absorbing: desactive_boutonC,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                // side: BorderSide(color: Colors.red)
                                              ),
                                              elevation: 3,
                                              textColor: Colors.black,
                                              child: Text(
                                                tampon.getOptionC() ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {

                                                  clic_bouton_C = !clic_bouton_C;
                                                });
                                                choix_3 = valeurChoisiC();

                                              },
                                              color: clic_bouton_C ? couleurApresSelection_C : couleurPardefault_C,
                                            ),
                                          ),
                                          height: 50,
                                          width: 250,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Visibility(
                                    visible: visibilite_bouton_C,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

                                      child: AbsorbPointer(
                                        absorbing: desactive_boutonC,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            // side: BorderSide(color: Colors.red)
                                          ),
                                          elevation: 3,
                                          textColor: Colors.black,
                                          child: Text(
                                            'C',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {

                                              clic_bouton_C = !clic_bouton_C;
                                            });
                                            choix_3 = valeurChoisiC();

                                          },
                                          color: clic_bouton_C
                                              ? couleurApresSelection_C
                                              : couleurPardefault_C,
                                        ),
                                      ),
                                      height: 58.0,
                                      width: 45,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

         Positioned(
          bottom: -10,
          child: Stack(
            alignment :  AlignmentDirectional.topCenter,

              children:<Widget> [

                CustomPaint(
                  size: Size(size.width, 90),
                  painter:  DessinBasBarNavigation(),
                ),
                Center(
                  heightFactor: 0.5,
                  child: RawMaterialButton(
                    elevation: 25 ,
                     fillColor: Colors.blueAccent,
                    shape: CircleBorder(),
                      child:   BoutonPlayStop(context),


                ),

                ),
                Visibility(
                  visible: visibilite_bouton_explication,

                  child: AbsorbPointer(
                    absorbing: desactive_bouton_Explication,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 200, 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.info_outline_rounded,
                          size : 30 ,
                          color: clic_bouton_explication
                              ? couleurApresSelection_bouton_Explication
                              : couleurPardefault_bouton_Explication,
                          //color: currentIndex == 0 ? Colors.white : Colors.blue,
                        ),
                        onPressed: () {

setState(() {
  clic_bouton_explication = !clic_bouton_explication;

});
                          setBottomBarIndex(0);

                          showDialog(
                               context: context,
                               barrierDismissible: true,
                               builder: (BuildContext context) {
                                 return AlertDialog(
                                   title: Text(tampon.getExplication()),
                                    actions: <Widget>[
                                     Container(
                                         key: intro.keys[0],
                                         child: Text(tampon.getExplication()  )
                                     ),

                                      Stack(
                                         children: <Widget>[
                                          Container(
                                            key: intro.keys[1],

                                            child: Image.asset(
                                              'assets/$chemin_image/$numeroImage.jpg',
                                              height: 270,
                                            ),
                                          ),
                                           Container(
                                             padding: EdgeInsets.fromLTRB(60, 80, 100, 0),

                                             child: SizedBox(

                                               width: 50,

                                              key: intro.keys[2],

                                              child:SvgPicture.asset(
                                                'assets/iconTheme/stop.svg',
                                                  width: 50.0,
                                                allowDrawingOutsideViewBox: true,
                                              ),
                                          ),
                                           ),
                                        ],
                                      ) ,

                                      FlatButton(
                                         onPressed: () {
                                           intro.dispose();
                                           intro.start(context);

                                         },
                                         child: Text('Animer') ,
                                      ) ,

                                   ],
                                 );
                               });


                        },
                        splashColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: visibilite_bouton_sauvegarde,

                  child: AbsorbPointer(
                    absorbing: desactive_bouton_Sauvegarde,

                    child: Container(
                      padding: EdgeInsets.fromLTRB(200, 10, 0, 0),
                       child: IconButton(
                        icon: Icon(


                          Icons.save,
                          size : 30 ,
                          color:  verifExisteQuestion ? couleurApresSelection_bouton_Sauvegarde : couleurPardefault_Sauvegarde

                          // color:currentIndex == 1 ? Colors.white : Colors.blue,
                        ),
                        onPressed: () {


                          String idQuestion = tampon.getIdQuestion();

                           String q = tampon.getQuestionText();
                          bool g = tampon.getFauteGrave() ;
                          String e = tampon.getExplication();

                          String optionA = tampon.getOptionA() ;

                          String idChoix = tampon.getOptionA() ;
                          String optionB = tampon.getOptionB();
                          String optionC = tampon.getOptionC();
                          bool repA = tampon.getBonneReponseA() ;
                          bool repB = tampon.getBonneReponseB() ;
                          bool repC = tampon.getBonneReponseC() ;
                          int NumeroImage = getNumImage() ;

                          Provider.of<Definition>(context , listen: false).ver();
                          Provider.of<Favoris>(context , listen: false).ajouterQuestion(idQuestion , q ,repA , repB , repC , g , e ,point , chemin_image , NumeroImage );

                        //   Provider.of<Favoris>(context , listen: false).ajouterQuestion( idQuestion , q ,  reponse_A , reponse_B , reponse_C , g , e , point , chemin_image , NumeroImage) ;



/*
                          if ( verifExisteQuestion == false ) {

                            String idQuestion = tampon.getIdQuestion();
                            String q = tampon.getQuestionText();
                            bool g = tampon.getFauteGrave() ;
                            String e = tampon.getExplication();


                            String optionA = tampon.getOptionA() ;
                            String idChoix = tampon.getOptionA() ;
                            String optionB = tampon.getOptionB();
                            String optionC = tampon.getOptionC();

                            bool reponse_A = tampon.getOptionA() ;

                            bool reponse_B = tampon.getOptionB();
                            bool reponse_C = tampon.getOptionC();
                            int NumeroImage = getNumImage() ;



                            Provider.of<Favoris>(context , listen: false).ajouterReponse(idChoix ,optionA, optionB, optionC);

                            Provider.of<Favoris>(context , listen: false).ajouterQuestion( idQuestion , q ,  reponse_A , reponse_B , reponse_C , g , e , point , chemin_image , NumeroImage) ;


                            setState(() {

                              verifExisteQuestion != verifExisteQuestion ;

                            });

                          }
*/

                            setBottomBarIndex(1);
                        },
                       ),
                    ),
                  ),
                ),


              ] ,

          ),
        ) ,
          ],
        ),
      ),
      backgroundColor: null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



    );
  }




}














