import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permis/Acceuil.dart';
import 'package:permis/ListeResultats.dart';
import 'package:provider/provider.dart';
import 'Constantes.dart';
import 'EcranQuestions.dart';
import 'EcranResultats.dart';
import 'EcranThemes.dart';
import 'IconContent.dart';


class EcranSolutions extends StatefulWidget {
  final String TitreTheme;

  const EcranSolutions({Key key, this.TitreTheme}) : super(key: key);


  @override
  EcranSolutionsState createState() => EcranSolutionsState();

}

/*
Color(0xfff44336) rouge
Color(0xff4caf50)  vert
*/

class EcranSolutionsState extends State<EcranSolutions> {

List tampon ;
String nom ;

  get _aChoisi => null;

  @override
  void initState() {
    super.initState();
    tampon =  Provider.of<Resultats>(context , listen: false).listeCouleur();
    super.initState() ;


  }

Icon _coeur = Icon(
  Icons.close,
  color: Colors.white,
  size : 50 ,

);

bool _likeBool = false;

void _likeThis() {
  BoutonSuivant();

}




void BoutonSuivant() {

  Provider.of<Resultats>(context , listen: false).reset();

  Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
      builder: (BuildContext context  ) =>
          Accueil(  )));


}


  @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white ,
      ),

      body:  Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.white, kCouleurBody]
          ),
        ),

        /*decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3, 0.7, 1],
                colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink])
        ),*/
        child: Column(
          children: <Widget> [


            _BilanResultat(),
            Center(

              child: GridView.builder(
                  shrinkWrap: true,

                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemCount: tampon.length,
                  itemBuilder: (context, index) {
                    Color item = tampon[index];

                    return GestureDetector(

                      onTap: ()  {

                        print( 'index $index') ;
                        Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                            builder: (BuildContext context  ) =>
                                EcranResultat(indexCourant: index )));


                      },

                      child: Container(
                        height: double.infinity,



                        child: Card(
                          //semanticContainer: false,
                          // color : Colors.black ,

                          color: item,
                          elevation: 5.0,
                          shadowColor : Colors.black26 ,
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

                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '${index}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),

            ),
          ],
        ),
      ),

      backgroundColor: null,

      floatingActionButton: SizedBox(
        width: 80,
        height: 80 ,
        child: FloatingActionButton(
          onPressed: _likeThis,
          backgroundColor: Colors.red,
          child: _coeur,
          elevation: 5,


        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          iconSize : 40 ,
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                icon: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                onPressed: (){
            print(' Ecran info solution ') ;
                },
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



Widget _BilanResultat() {
  return RawMaterialButton(
    elevation: 1.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 1, top: 5),
          child: Text(

            'SCORE ',
            style: TextStyle(
              fontFamily: 'Spectral',
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
            ),
          ),


        ),
        Container(
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 1, top: 5),


          child: Text(
            ' 0 / 10 ',
            style: TextStyle(
              fontFamily: 'Spectral',
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
                backgroundColor : Colors.white ,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),

        Container(
          child: Text(
              ' Section : ${TitreTheme}' ,

  style: TextStyle(
  fontFamily: 'Spectral',
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w300,
  ),
          ),

          /*decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,

          ),*/
        ),
      ],
    ),

  );
}

}


