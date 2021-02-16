import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Constantes.dart';
import 'EcranQuestionExamen.dart';
import 'EcranQuestions.dart';

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

class HorizontalItem extends StatelessWidget {

  final String NomImageSVG;
  final String nomTheme;

  const HorizontalItem({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);


  @override
  Widget build(BuildContext context) =>  Container(
    height: double.infinity,



    child:  GestureDetector(

      onTap: () {


        Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
            builder: (BuildContext context  ) =>
                EcranQuestions(titrePage: '${ nomTheme}' )));


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
class HorizontalItemExamen extends StatelessWidget {

  final String NomImageSVG;
  final String nomTheme;

  const HorizontalItemExamen({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);


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