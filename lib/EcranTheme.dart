import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BouttonProfil.dart';
import 'ButonThemes.dart';
import 'package:permis/ImageText_theme.dart';
import 'Constantes.dart';
import 'package:permis/EcranConducteur.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permis/TableIthemes.dart';
import 'package:permis/BasBarNavigation.dart';
import 'EcranProfil.dart';
import 'EcranQuestions.dart';
import 'package:permis/BouttonProfil.dart';

final String titrePage='EcranThemes' ;
final String _nomPrenom = "MATIAL MONKAM";


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
    Theme('conducteur', 'Conducteur '),
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

  String chemin = 'assets/profil/martial.jpg' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Container(
            child: BouttonProfil (
              CheminImage : chemin,
              onPressed: ()  {
                Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                    builder: (BuildContext context  ) =>
                        EcranProfil()));

              },

            ) ,
          ) ,
        ],

      ),
        backgroundColor: kCouleurBody ,
      ),


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
