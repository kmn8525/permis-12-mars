
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:permis/Acceuil.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Constantes.dart';
import 'EcranSolutions.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'ListeFeux.dart';
import 'ListeInjonction.dart';
import 'ListeResultats.dart';

//final cleEcranQuestions = new GlobalKey<EcranQuestionsState>();
//final _innerKey = GlobalKey<InnerWidgetState>();


var listRep = [] ;



var tampon = null ;
String chemin ;
String TitreTheme ;
int MoyennePoint = 0 ;

class EcranQuestionsExamen extends StatefulWidget  {

  final String titrePage;


  EcranQuestionsExamen({Key key , this.titrePage}) : super(key: key);


  @override
  EcranQuestionsExamenState createState() => EcranQuestionsExamenState();


  Object chargementListesDeQuestion() {

    if (titrePage == 'DEFINITION') {
      var d = () => Definition();
      tampon = d();
      chemin = 'imageDefinition';



    }

    else if (titrePage == 'CONDUCTEUR') {
      {
        var c = () => ConducteurPassager();
        tampon = c();
        chemin = 'imageConducteurPassager';
      }
    }
    else if (titrePage == 'INJONCTIONS') {
      {
        var i = () => Incjontion();
        tampon = i();
        chemin = 'ImageInjonction';
      }
    }
    else if (titrePage == 'FEUX') {
      {
        var f = () => Feux();
        tampon = f();
        chemin = 'ImageSignaux';
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



}

class EcranQuestionsExamenState extends State<EcranQuestionsExamen>  with ChangeNotifier , SingleTickerProviderStateMixin {




  void  aficher ( ){
    if(this.mounted) {
      print('=======');
    }
    else {
      setState(() {
        print('=======');
      });
    }




  }

  String liensImage (){

    return chemin ;
  }

  String TitreQuestion (){

    return widget.titrePage ;
  }

  @override
  void initState() {

    start () ;
    startTimer();
    widget.chargementListesDeQuestion();
    widget.chargementTitreTheme();
    TitreQuestion () ;
    resetColor();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),

    );

    super.initState();


  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();

  }


  bool verifi = false ;



  Color couleurPardefault_A = Color(0xffffffff) ;
  Color couleurPardefault_B =  Color(0xffffffff) ;
  Color couleurPardefault_C =  Color(0xffffffff) ;

  Color couleurApresSelection_A = Colors.orange;
  Color couleurApresSelection_B = Colors.orange;
  Color couleurApresSelection_C = Colors.orange;
  Color couleurAnimation = Colors.blueAccent ;

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
  int  point;


  bool clic_bouton_A = false;
  bool clic_bouton_B = false;
  bool clic_bouton_C = false;

  bool visibilite_bouton_Valider = true;
  bool visibilite_bouton_Suivant = false;
  bool visibilite_bouton_C = false;

  bool desactive_boutonA = false;
  bool desactive_boutonB = false;
  bool desactive_boutonC = false;

  int numeroImage = 1;

  Color couleurChoix = Colors.red;

  Color checkAnswer(bool a, bool b, bool c) {
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
        MoyennePoint = MoyennePoint - 1 ;
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
          MoyennePoint = MoyennePoint + 1 ;

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

  void startTimer() {
    const oneSec = const Duration(seconds: 3);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {

        if (_start == 1) {
          setState(() {
            couleurAnimation = Colors.red ;

          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );

  }

  void stop() {

    _animationController.stop() ;
  }
  void start (){

    Timer(Duration(seconds: 3), () {

      _animationController.addStatusListener((status) {

        setState(() {

          if ( status == AnimationStatus.completed) {
            // context.read<EcranQuestionsState>().BoutonSuivant();
            Color CouleurAchoisi =  checkAnswer(choix_1, choix_2, choix_3);

            Provider.of<Resultats>(context , listen: false).ajouterCouleurResultats(CouleurAchoisi);
            BoutonSuivant();
            _animationController.repeat() ;

            //_ecqBloc.aficherStream.listen((event) { }) ;
            // cleEcranQuestions.currentState.aficher();
            // couleur = Colors.blueAccent ;
            // cleEcranQuestions.currentState.aficher ();
            _timer.cancel();

            //_animationController.repeat();
          }
        });


      }) ;
      _animationController.addListener( () {
        setState(() { });
      });

      _animationController.forward();


    });


  }





  void BoutonSuivant() {


    resetColor();
    setState(() {

      if (tampon.estFini() == true) {


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
                  Provider.of<Resultats>(context , listen: false).reset();

                  Navigator.pop(context);
                  resetColor();

                  // REINITIALISATION DE LA LISTE

                  tampon.reset();


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

        resetColor();



      }

    });


  }

  void BoutonValider() {
    setState(() {
      choix_1 = null;
      choix_2 = null;
      choix_3 = null;
      stop() ;

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





  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;

    setState(() {

      if (  tampon.getOptionC()   == 'null' ) {


        visibilite_bouton_C = false ;

      }
      else {
        visibilite_bouton_C = true ;
      }
    });



    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        title: Row(
          children: <Widget> [
            Text(widget.titrePage),
          ],
        ),
      ),
      body: Container(
        height: hauteur,
        color: kCouleurBody,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          'assets/$chemin/$numeroImage.png',
                          height: 270,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(2),
                  child: Text(
                    tampon.getQuestionText(),

                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Wrap(
                // spacing: 2,
                runSpacing: -35,
                children: <Widget>[

                  /////////////////////////////////////////////////////////////////////
                  ///// ---------------   BOUTON  1  -------------- /////////
                  /////////////////////////////////////////////////////////////////////
                  Row(
                    children: <Widget>[
                      Container(
                        child: Container(
                          margin: EdgeInsets.all(30),
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
                                  fontSize: 20.0,
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
                      Container(
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
                                  fontSize: 20.0,
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
                          width: 50,
                        ),
                      ),
                    ],
                  ),


                  /////////////////////////////////////////////////////////////////////
                  ///// ---------------   BOUTON  2  -------------- /////////
                  /////////////////////////////////////////////////////////////////////
                  Row(
                    children: <Widget>[
                      Container(
                        child: Container(
                          margin: EdgeInsets.all(30),
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
                                  fontSize: 20.0,
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
                        child: Container(
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
                                'B',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
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
                          width: 50,
                        ),
                      ),
                    ],
                  ),


                  /////////////////////////////////////////////////////////////////////
                  ///// ---------------   BOUTON  3  -------------- /////////
                  /////////////////////////////////////////////////////////////////////

                  Row(
                    children: <Widget>[
                      Visibility(
                        visible: visibilite_bouton_C,
                        child: Container(
                          margin: EdgeInsets.all(30),
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
                                  fontSize: 20.0,
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

                      Visibility(
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
                                'C',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
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
                          height: 50.0,
                          width: 50,
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
      backgroundColor: kCouleurBodyTheme,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        child: BoutonPlayStop( context),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin : 6 ,
        elevation: 5 ,
        color: Colors.white,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize : 20 ,
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                icon: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),


    );
  }

  Widget BoutonPlayStop(BuildContext context) {

    return  GestureDetector(
      child: SizedBox(
        width: 80,
        height: 80 ,
        child: LiquidCircularProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(couleurAnimation),
          center: Row(
            children: [
              Visibility(
                visible: visibilite_bouton_Valider,

                child: Expanded(
                  child: Container(
                    child: FlatButton(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 50.0,
                      ),
                      onPressed: () {

                        Color CouleurAchoisi =  checkAnswer(choix_1, choix_2, choix_3);

                        Provider.of<Resultats>(context , listen: false).ajouterCouleurResultats(CouleurAchoisi);

                        BoutonValider();

                        String q = tampon.getQuestionText();
                        String g = tampon.getFauteGrave() ;
                        String e = tampon.getExplication();

                        String optionA = tampon.getOptionA() ;
                        String optionB = tampon.getOptionB();
                        String optionC = tampon.getOptionC();

                       // Provider.of<Resultats>(context , listen: false).ajouterQuestion(q , choix_1 , choix_2, choix_3, g , e);
                        Provider.of<Resultats>(context , listen: false).ajouterReponse(optionA, optionB, optionC);

                        setState(() {
                          desactive_boutonA = !desactive_boutonA;
                          desactive_boutonB = !desactive_boutonB;
                          desactive_boutonC = !desactive_boutonC;
                        });
                      },
                    ),

                  ),
                ),

              ),
              Visibility(
                visible: visibilite_bouton_Suivant,
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: FlatButton(
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.black,
                        size: 50.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                      onPressed: () {

                        BoutonSuivant();

                      },
                      // color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),


    );

  }



}















