import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Constantes.dart';
import 'EcranQuestionExamen.dart';
import 'EcranQuestions.dart';
import 'ListeDefinition.dart';
import 'Utility.dart';

var tampon = null ;
String CleTheme ;

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
    height: 96,
    child: Card(
      child: Text(
        '$title a long title',
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      ),
    ),
  );
}


class HorizontalItemQuestion extends StatefulWidget {
  final String NomImageSVG;
  final String nomTheme;

  const HorizontalItemQuestion({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);

  @override
  HorizontalItemQuestionState createState() => HorizontalItemQuestionState();



 }


class HorizontalItemQuestionState extends State<HorizontalItemQuestion> {
  Color c ;
  String etat ;

  int numQD = 0   ;
  int nbCD  ;
  int nbQCO  ;
  int nbQCCO  ;

  String RcleQD=""  ;
  int i = 0 ;
  String cleNumQD = "qDef";
  void  StatuTheme( BuildContext context  ) {

    Utility.instance.getIntegerValue(RcleQD)
        .then((value) => setState(() {
      numQD = value ;

    }));



    if    ((widget.nomTheme == 'DEFINITION' ) && ( numQD == 0) ) {
      c = Colors.black ;


    }

    else {
      c = Colors.red ;
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
            //  padding: EdgeInsets.all(15),

            child: Text(
              "CORRECTION",
              style: TextStyle(color: Colors.white, fontSize: 8),
            ),


            onPressed:  () {

              Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                  builder: (BuildContext context  ) =>
                      EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: 0)));

            },



          )

        ],



      ).show();



    }


  }


  Future<Null> getSharedPrefs() async {
    Utility.instance.getIntegerValue(RcleQD)
        .then((value) => setState(() {
       numQD = value ;

    }));
  }

  Widget  buildSharedPreferencesCounter() {
    return FutureBuilder<int>(
      future: Utility.instance.getIntegerValue(RcleQD),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          numQD = snapshot.data;

          return Text(snapshot.data.toString()) ;
        }

        return Text("null");
      },
    );
  }

  @override
  void initState() {
    RcleQD =  Provider.of<Definition>(context , listen: false).getCleNumQueDef ;


    getSharedPrefs() ;
       /*Utility.instance.getIntegerValue(RcleQD)
        .then((value) => setState(() {
       numQD = value ;

    }));*/



super.initState();

  }

  void chargeCouleur() {
    if  ((widget.nomTheme == "DEFINITION" ) )
      {
        if ( numQD > 0) {

          setState(() {
            c = Colors.red ;
          });
        }

        else {
          c = Colors.black ;

        }
      }

  }


  @override
  Widget build(BuildContext context) {


    chargeCouleur();
   return Container(
      height: double.infinity,



      child:  GestureDetector(

        onTap: () {

print('numQD') ;
print(numQD) ;

            if  ((widget.nomTheme == "DEFINITION" ) )
            {
              if ( numQD > 0) {
                var alertStyle = AlertStyle(
                  animationType: AnimationType.fromTop,
                  isCloseButton: false,
                  isOverlayTapDismiss: true,
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
                  title: "Ce Theme a deja ete Commencer voulez-vous reprendre",

                  // desc: "Voulez-vous continuez ?.",

                  buttons: [


                    DialogButton(
                      margin: EdgeInsets.all(15),

                      child: Text(

                        "OUI",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),


                      onPressed:  () {

                        Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                            builder: (BuildContext context  ) =>
                                EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQD)));

                      },


                      color: Colors.green,

                    ) ,
                    DialogButton(
                      margin: EdgeInsets.all(15),

                      child: Text(

                        "NON",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),


                      onPressed:  () {

                        Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                            builder: (BuildContext context  ) =>
                                EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: 0)));

                      },


                      color: Colors.deepOrangeAccent,

                    ) ,


                  ],



                ).show();


              }

              else {

                Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                    builder: (BuildContext context  ) =>
                        EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQD)));

              }


            }


          // utilisateurTheme('${item.nomTheme}' ) ;

        },



        child: Container(
          height: double.infinity,

          child: Card(
            //semanticContainer: false,

            color: kCouleurAppBar,
            elevation: 4.0,
            shadowColor : Colors.black ,
            margin: EdgeInsets.symmetric(vertical : 8 ,horizontal: 8),


            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),)) ,


            child: Container(

              alignment: Alignment.center ,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(4),

                    child: SvgPicture.asset(
                      'assets/iconTheme/${widget.NomImageSVG}.svg',
                      height: 43.0,
                      width: 43.0,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  Divider(
                    color: c,
                  ),
                  Expanded(
                    child: Text(
                      '${widget.nomTheme}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 8),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}





class HorizontalItemExamen extends StatelessWidget {

  final String NomImageSVG;
  final String nomTheme;

   const  HorizontalItemExamen({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);





  @override
  Widget build(BuildContext context) =>  Container(
    height: double.infinity,



    child:  GestureDetector(

      onTap: () {


        Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
            builder: (BuildContext context  ) =>
                EcranQuestionsExamen(titrePage: '${ nomTheme}' )));


        // utilisateurTheme('${item.nomTheme}' ) ;

      },



      child: Container(
        height: double.infinity,



        child: Card(
          //semanticContainer: false,

          color: kCouleurAppBar,
          elevation: 6.0,
          shadowColor : Colors.black38 ,
          margin: EdgeInsets.symmetric(vertical : 8 ,horizontal: 8),


          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),)) ,


          child: Container(

            alignment: Alignment.center ,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(4),

                  child: SvgPicture.asset(
                    'assets/iconTheme/${NomImageSVG}.svg',
                    height: 43.0,
                    width: 43.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    '${nomTheme}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),


  );
}





/// Wrap Ui item with animation & padding
Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
    ) animationItemBuilder(
    Widget Function(int index) child, {
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        int index,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
    BuildContext context,
    Animation<double> animation,
    ) animationBuilder(
    Widget child, {
      double xOffset = 0,
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );