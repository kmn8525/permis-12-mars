import 'package:flutter/material.dart';
import 'package:permis/EcranTheme.dart';
import 'Constantes.dart';
import 'Acceuil.dart';

void main() => runApp(PAGE_Accueil());

class PAGE_Accueil extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       primaryColor: kCouleurAppBar ,
            scaffoldBackgroundColor: kCouleurBody,
        accentColor: Colors.blue ,
    ),
      home: Accueil (),
      initialRoute: 'Accueil',

    );
  }
}




/*Expanded(
child: Text(

'Croisement Dépassement' ,
style: StyleTextLong,

),*/

/*
Expanded(
child: Padding(
padding: EdgeInsets.all(15.0),
child: FlatButton(
color: Colors.red,
child: Text(
'False',
style: TextStyle(
fontSize: 20.0,
color: Colors.white,
),
),
onPressed: () {
//The user picked false.
checkAnswer(false);
},
),
),
),*/

/*Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget> [
                     //Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),

                     Row(
                         children:<Widget> [
                           SvgPicture.asset('assets/images/depacement.svg' ,
                             height: 60.0,
                             width: 60.0,

                           ) ,
                         ],

                     ),
                     Expanded(
                       child: Text(

                          'Croisement Dépassement' ,
                            style: StyleTextLong,

                   ),
                     ) ,

                    ],
                  ),*/