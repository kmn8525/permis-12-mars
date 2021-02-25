
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:permis/Constantes.dart';
import 'package:provider/provider.dart';

import 'EcranQuestions.dart';
import 'EcranSolutions.dart';
import 'ListeResultats.dart';

final  cleEcranResultat = new GlobalKey<EcranResultatState>();



var listRep = [] ;



var tampon = null ;
String chemin = 'imageDefinition' ;
int MoyennePoint = 0 ;


class EcranResultat extends StatefulWidget {

  final int indexCourant;


  const EcranResultat({Key key, this.indexCourant}) : super(key: key);


  @override
  EcranResultatState createState() => EcranResultatState();

}

class EcranResultatState extends State<EcranResultat>  with ChangeNotifier{

  List listeQuestionResultat ;
  List listeChoixResultat ;
  List verification ;

  String question ;
 String option_A;
 String option_B;
 String  option_C;
 String liensImage ;


  Color couleurBouton_A  = Colors.white ;
  Color couleurBouton_B  = Colors.white ;
  Color couleurBouton_C  = Colors.white;

  Color couleurSelection_A  ;
  Color couleurSelection_B  ;
  Color couleurSelection_C  ;



  bool clic_bouton_A = true;
  bool clic_bouton_B = true;
  bool clic_bouton_C = true;

  bool visibilite_bouton_Suivant = true;

  bool visibilite_bouton_C = false;

  bool desactive_boutonA = false;
  bool desactive_boutonB = false;
  bool desactive_boutonC = false;

  int numeroImage = 1;

  Color couleurChoix ;
  Color couleurAnimation = Colors.white;




  @override
  void initState() {
    listeQuestionResultat =  Provider.of<Resultats>(context , listen: false).listeQuestionResultat() ;
    listeChoixResultat =  Provider.of<Resultats>(context , listen: false).listeOption();

    question =  Provider.of<Resultats>(context , listen: false).getQuestionText(widget.indexCourant);
    option_A =  Provider.of<Resultats>(context , listen: false).getOptionA(widget.indexCourant);
    option_B = Provider.of<Resultats>(context , listen: false).getOptionB(widget.indexCourant);
    option_C = Provider.of<Resultats>(context , listen: false).getOptionC(widget.indexCourant);

    couleurBouton_A =   Provider.of<Resultats>(context , listen: false).getColoueurBoutonA(widget.indexCourant);
    couleurBouton_B =   Provider.of<Resultats>(context , listen: false).getColoueurBoutonB(widget.indexCourant);
    couleurBouton_C =   Provider.of<Resultats>(context , listen: false).getColoueurBoutonC(widget.indexCourant);

    couleurSelection_A  = Provider.of<Resultats>(context , listen: false).getColoueurSelectionA(widget.indexCourant);
    couleurSelection_B  = Provider.of<Resultats>(context , listen: false).getColoueurSelectionB(widget.indexCourant);
    couleurSelection_C  = Provider.of<Resultats>(context , listen: false).getColoueurSelectionC(widget.indexCourant);



    liensImage =  Provider.of<EcranQuestionsState>(context , listen: false).liensImage();

    super.initState();


  }




// ----- REINITIALISATION DES COULEUR APRES LA PROCHAINE QUESTION ---- //

  void resetColor() {
    setState(() {

    });
  }

  void _checkFin() {

  }

  void _aChoisi(int value) {
  }







  void BoutonSuivant() {
    resetColor();

    Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
        builder: (BuildContext context  ) =>
            EcranSolutions(  )));


  }




  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    int  i = widget.indexCourant  ;

    setState(() {

      if (  option_C  == 'null' ) {


        visibilite_bouton_C = false ;

      }
      else {
        visibilite_bouton_C = true ;
      }



    });

    return Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading: false,

          title: Row(
            children: <Widget> [
               Text("RESULTAT"),
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
                          'assets/$liensImage/${i + 1}.jpg',
                          height: 300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Text(
                     ' $question' ,
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
                                  '$option_A',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () {

                                },
                                color: couleurBouton_A ,
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
                                },
                                color: couleurSelection_A ,
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
                                  '$option_B',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () {
                                },
                                color: couleurBouton_B ,

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


                                },

                                color: couleurSelection_B ,
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
                                child: Text( '$option_C',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () {


                                },

                                color: couleurBouton_C,

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


                                },
                                color: couleurSelection_C ,

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
        backgroundColor: null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        child: BoutonPlayStop( context),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin : 6 ,
        elevation: 7 ,
        color: Colors.white,
        child: Container(
          height: 55,
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
                tooltip: 'Information',
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                onPressed: null,
                tooltip: 'Partager',

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
          value: 0.0,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(couleurAnimation),
          center: Row(
            children: [
               Expanded(
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
            ],
          ),

        ),
      ),


    );

  }

}




