import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permis/Constantes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'AnimationBouttonPlay.dart';
import 'BoutonReponse.dart';
import 'BouttonQuestion.dart';
import 'ConstructeurBasBarDeNavigation.dart';
import 'IconContent.dart';
import 'ListeDefinition.dart';
import 'package:permis/ListeConducteurPassager.dart';
import 'EcranTheme.dart';
import 'ListeFeux.dart';
import 'ListeInjonction.dart';

var tampon = null ;
String chemin ;

class EcranQuestion extends StatefulWidget {
  final String titrePage;

  const EcranQuestion({this.titrePage});

  @override
  _EcranQuestionState createState() => _EcranQuestionState();
}

class _EcranQuestionState extends State<EcranQuestion> {

  @override
  void initState() {
    super.initState();
    _chargementListesDeQuestion();
    resetColor();

  }
  Color couleurPardefault_A = Color(0xffffffff) ;
  Color couleurPardefault_B =  Color(0xffffffff) ;
  Color couleurPardefault_C =  Color(0xffffffff) ;

  Color couleurApresSelection_A = Colors.orange;
  Color couleurApresSelection_B = Colors.orange;
  Color couleurApresSelection_C = Colors.orange;
  bool choix_1;
  bool choix_2;
  bool choix_3;
  bool valeur_choisi;


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


  void checkAnswer(bool a, bool b, bool c) {
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
        }

        // --------------------------------------//
// ----- ON TESTE SI TOUTE LES VALEURS  SONT SELECTIONNER ---- //
        // --------------------------------------//

        else if ((a != null) & (b != null) & (c != null))
        {
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
        }

        // --------------------------------------//
// ----- ON TESTE SI   A ET B  SONT SELECTIONNER ---- //
        // --------------------------------------//
        else if ((a != null) & (b != null) )
        {
          verif_a = tampon.getBonneReponseA();
          verif_b = tampon.getBonneReponseB();
          verif_c = tampon.getBonneReponseC();

          if ((verif_a == a) & (verif_b == b)) {
            couleurApresSelection_A = Colors.green;
            couleurApresSelection_B = Colors.green;
            couleurApresSelection_C = Colors.white;

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

        }

        // --------------------------------------//
// ----- ON TESTE SI   A ET C  SONT SELECTIONNER ---- //
        // --------------------------------------//

        else if ((a != null) & (c != null) )
        {
          verif_a = tampon.getBonneReponseA();
          verif_b = tampon.getBonneReponseB();
          verif_c = tampon.getBonneReponseC();

          if ((verif_a == a) & (verif_c == c)) {
            couleurApresSelection_A = Colors.green;
            couleurApresSelection_C = Colors.green;
            couleurPardefault_B = Colors.white;
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

        }

        // --------------------------------------//
// ----- ON TESTE SI   B ET C  SONT SELECTIONNER ---- //
        // --------------------------------------//
        else if ((b != null) & (c != null) )
        {

          verif_a = tampon.getBonneReponseA();
          verif_b = tampon.getBonneReponseB();
          verif_c = tampon.getBonneReponseC();

          if ((verif_b == b) & (verif_c == c)) {
            couleurApresSelection_B = Colors.green;
            couleurApresSelection_C = Colors.green;
            couleurPardefault_C = Colors.white;
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

        }

        // --------------------------------------//
// ----- ON SELECTIONNE A  ET   B , C SONT NULL---- //
        // --------------------------------------//

        else if ((a != null) & (b == null) & (c == null))
        {
          verif_a = tampon.getBonneReponseA();
          verif_b = tampon.getBonneReponseB();
          verif_c = tampon.getBonneReponseC();

          if ((verif_a == a) & (verif_b == true)) {
            couleurApresSelection_A = Colors.green;
            couleurPardefault_B = Colors.green;
            couleurPardefault_C = Colors.white;
          } else if ((verif_b == true) & (verif_c == true)) {
            couleurApresSelection_A = Colors.red;
            couleurPardefault_B = Colors.green;
            couleurPardefault_C = Colors.green;
          } else if ((verif_a == a) & (verif_c == true)) {
            couleurApresSelection_A = Colors.green;
            couleurPardefault_B = Colors.white;
            couleurPardefault_C = Colors.green;
          } else  if (verif_a == a)  {
            couleurApresSelection_A = Colors.green;
            couleurPardefault_B = Colors.white;
            couleurPardefault_C = Colors.white;
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


        }

        // --------------------------------------//
// ----- ON  SELECTIONNE B  ET   A , C SONT NULL ---- //
        // --------------------------------------//

        else if ((b != null) & (a == null) & (c == null))
        {
          verif_a = tampon.getBonneReponseA();
          verif_b = tampon.getBonneReponseB();
          verif_c = tampon.getBonneReponseC();

          if ((verif_b == b) & (verif_a == true)) {
            couleurApresSelection_B = Colors.green;
            couleurPardefault_A = Colors.green;
            couleurPardefault_C = Colors.white;
          } else if ((verif_b == true) & (verif_c == true)) {
            couleurApresSelection_B = Colors.red;
            couleurPardefault_A = Colors.green;
            couleurPardefault_C = Colors.green;
          } else if ((verif_b == b) & (verif_c == true)) {
            couleurApresSelection_B = Colors.green;
            couleurPardefault_A = Colors.white;
            couleurPardefault_C = Colors.green;
          }  else  if (verif_b == b)  {
            couleurApresSelection_B = Colors.green;
            couleurPardefault_B = Colors.green;
            couleurPardefault_C = Colors.white;
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
        }
        // --------------------------------------//
// ----- ON  SELECTIONNE C  ET   A , B SONT NULL---- //
        // --------------------------------------//

        else if ((c != null) & (a == null) & (b == null))
        {
          verif_a = tampon.getBonneReponseA();
          verif_b = tampon.getBonneReponseB();
          verif_c = tampon.getBonneReponseC();

          if ((verif_c == c) & (verif_a == true)) {
            couleurApresSelection_C = Colors.green;
            couleurPardefault_A = Colors.green;
            couleurPardefault_B = Colors.white;
          } else if ((verif_b == true) & (verif_a == true)) {
            couleurApresSelection_C = Colors.red;
            couleurPardefault_A = Colors.green;
            couleurPardefault_B = Colors.green;
          } else if ((verif_c == c) & (verif_a == true)) {
            couleurApresSelection_C = Colors.green;
            couleurPardefault_B = Colors.white;
            couleurPardefault_A = Colors.green;
          }  else  if (verif_c == c)  {
            couleurApresSelection_C = Colors.green;
            couleurPardefault_B = Colors.white;
            couleurPardefault_A = Colors.white;
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
        }

    });


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

  void _checkFin() {

  }


  void  _chargementListesDeQuestion () {
    if (widget.titrePage == 'DEFINITION') {
      var d = () => Definition();
      tampon = d();
      chemin = 'imageDefinition';
    }

    else if (widget.titrePage == 'CONDUCTEUR') {
      {
        var c = () => ConducteurPassager();
        tampon = c();
        chemin = 'imageConducteurPassager';
        print('tampon  CONDUCTEUR: $tampon');
      }
    }
    else if (widget.titrePage == 'INJONCTIONS') {
      {
        var i = () => Incjontion();
        tampon = i();
        chemin = 'ImageInjonction';
      }
    }
    else if (widget.titrePage == 'FEUX') {
      {
        var f = () => Feux();
        tampon = f();
        chemin = 'ImageSignaux';
      }
    }
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

            desc: "Voulez-vous continuez ?.",
            buttons: [
              DialogButton(
                  child: Text(
                    "OUI",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Color.fromRGBO(0, 179, 134, 1.0),

                  onPressed: ()
                  {
                    Navigator.pop(context);
                    resetColor();

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
                child: Text(
                  "NON",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () =>
                    Navigator.of(context  , rootNavigator: false).push(MaterialPageRoute(
                        builder: (BuildContext context  )  => EcranThemes())),


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

        visibilite_bouton_Valider = !visibilite_bouton_Valider;
        visibilite_bouton_Suivant = !visibilite_bouton_Suivant;

        print('choix_1  choix_2 choix_3  $choix_1  $choix_2 $choix_3   ') ;
        //visibilite_bouton_C = ! visibilite_bouton_C ;
      });


    }

    void _aChoisi(int value) {
      print('kmnn');
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
                        child: Image.asset(
                          'assets/$chemin/$numeroImage.png',
                          height: 300,
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
                                  print('--------- 6 ------------');
                                  print(
                                      'choix_1  : $choix_1 -  clic_bouton_A : $clic_bouton_A');

                                  choix_1 = valeurChoisiA();
                                  print('---------  6.1  ------------');
                                  print(
                                      'choix_1   :$choix_1  - clic_bouton_A : $clic_bouton_A');

                                  print(
                                      'choix_2   :$choix_2 - clic_bouton_B : $clic_bouton_B');
                                  print(
                                      'couleurApresSelection_A   :$couleurApresSelection_A - couleurPardefault_A : $clic_bouton_B');
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
                                  print('--------- 6 ------------');

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
          child: AnimationBouttonPlay(
            boutonEnfant: Row(
              children: [
                Visibility(
                  visible: visibilite_bouton_Valider,
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: FlatButton(
                        child: IconContent(
                          icon: Icons.play_circle_outline,
                        ),
                        onPressed: () {
                          print('choix_1  choix_2 choix_3  $choix_1  $choix_2 $choix_3   ') ;

                          checkAnswer(choix_1, choix_2, choix_3);
                          BoutonValider();
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
                        child: IconContent(
                          icon: Icons.skip_next,
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
        bottomNavigationBar: ModifierBottomAppBar(
          iconSelectionner: _aChoisi,
          items: [
            ModifierAppBarItem(icon: Icons.info_outline),
            ModifierAppBarItem(icon: Icons.folder_shared),
          ],
        ),
      );
    }
  }



