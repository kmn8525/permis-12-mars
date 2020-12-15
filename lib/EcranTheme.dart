import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ButonThemes.dart';
import 'package:permis/ImageText_theme.dart';
import 'Constantes.dart';
import 'package:permis/EcranConducteur.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permis/TableIthemes.dart';
import 'package:permis/BasBarNavigation.dart';
import 'EcranQuestions.dart';

final String titrePage='EcranThemes' ;

class EcranThemes extends StatefulWidget {
  static  const String id = 'EcranThemes' ;


  @override
  _EcranThemeState createState() => _EcranThemeState();
}


class Theme {
  Theme(this.NomImageSVG, this.nomTheme);

  final String NomImageSVG;

  final String nomTheme ;
}

class _EcranThemeState extends State<EcranThemes> {
  List<Theme> _themes = [
    Theme('informations', 'Definition'),
    Theme('conducteur', 'CONDUCTEUR ET PASSAGER '),
    Theme('policiere', 'INJONCTIONS'),
    Theme('feuxControl', 'LES FEUX'),
    Theme('danger', 'SIGNAUX ROUTIERS'),
    Theme('paint', 'MARQUES ROUTIERES'),
    Theme('chantier', 'LA VOIE PUBLIC'),
    Theme('priorites', 'LES PRIORITÉS'),
    Theme('pieton', 'LES USAGERS FAIBLES'),
    Theme('train4', 'LES AUTRES USAGERS'),
    Theme('vitesse', 'LA VITESSE'),
    Theme('depacement', 'CROISEMENT ET DEPACEMENT'),
    Theme('direction', 'PARTAGER LA ROUTE'),
    Theme('escargot', 'ZONE LENTE'),
    Theme('lieu', 'OÙ CIRCULER'),
    Theme('autoroute', 'ROUTES ET AUTOROUTES'),
    Theme('stopss', 'INTERDICTION'),
    Theme('accident', 'PANNE ET ACCIDENT'),
    Theme('pas_alcool', 'ALCOOL ET IMPREGNATION'),
    Theme('vest', 'EQUIPEMENTS GENERAL'),
    Theme('mainvolant', 'TECHNIQUE DE CONDUITE'),
    Theme('battery', 'MECANIQUE DE VEHICULE'),
    Theme('parkingss', 'ARRET ET STATIONEMENT'),
    //Theme('ecologie', 'ECOLOGIE'),
    Theme('ampoule', 'DIVERS'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
          )
      ),
      /*appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            onPressed: () {
              print('kmn');
            },
            child: Text('kmm'),
            color: Colors.white,
            elevation: 1,
          )
        ],
      ),*/

      body: Center(
        child: GridView.builder(
            shrinkWrap: true,

            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: _themes.length,
            itemBuilder: (context, index) {
              final item = _themes[index];

              return GestureDetector(

                onTap: () {
                  Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                      builder: (BuildContext context  ) =>
                          EcranQuestion(titrePage: '${item.nomTheme}' )));


                  // Navigator.pushReplacementNamed(context, '/route1');
                },
                child: Container(
                  height: double.infinity,



                  child: Card(
                    //semanticContainer: false,
                    // color : Colors.black ,

                    color: kCouleurAppBar,
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
                          Container(
                            // margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(4),

                            child: SvgPicture.asset(
                              'assets/iconTheme/${item.NomImageSVG}.svg',
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
                              '${item.nomTheme}',
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
              );
            }),
      ),
    );
  }
}

/*Expanded(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget> [
Expanded(
child: Bouton_Acceuil(
couleur: Colors.black38,
boutonEnfant: Column (
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget> [
BouttonImageText(imageSVG:'boite_manuel' , nomTheme: 'TECHNIQUE DE CONDUITE',),

],
)

),
),
SizedBox(
width: 20,
) ,
],

),
) ,*/

/*
bottomNavigationBar: BottomNavigationBar(


backgroundColor: kCouleurAppBar,
selectedItemColor: Colors.red ,
type: BottomNavigationBarType.fixed,
iconSize: 20,

items: const <BottomNavigationBarItem>[

BottomNavigationBarItem(
icon: Icon(
Icons.border_all,
color: Colors.black,

),
title: Text(
'Thèmes',
style: TextStyle(
color: Colors.black),
),
activeIcon: Icon(
Icons.border_all,
color: kCouleurAppBar,
size: 36,
),
),

BottomNavigationBarItem(
icon: Icon(
Icons.library_books,
color: Colors.black,
),
title: Text(
'Cours',
style: TextStyle(
color: Colors.black),
),
),
BottomNavigationBarItem(
icon: Icon(
Icons.access_alarms,
//size: 5,
color: Colors.black,

),
title: Text(
'Examens',
style: TextStyle(
color: Colors.black),
),
),
BottomNavigationBarItem(
icon: Icon(
Icons.videogame_asset,
//size: 5,
color: Colors.black,

),
title: Text(
'Jeux',
style: TextStyle(
color: Colors.black),
),
),

BottomNavigationBarItem(

icon: Icon(
const IconData(0xe900 , fontFamily: 'reglages' ) ,
color: Colors.black,

),
title: Text(
'Réglages',
style: TextStyle(
color: Colors.black),
),
),


],

// onTap: _onItemTapped,
),*/


