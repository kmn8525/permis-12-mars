import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BouttonProfil.dart';

import 'Constantes.dart';
import 'package:flutter_svg/svg.dart';

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
    Theme('informations', 'DEFINITION'),
    Theme('conducteur', 'CONDUCTEUR'),
    Theme('policiere', 'INJONCTIONS'),
    Theme('feuxControl', 'FEUX'),
    Theme('danger', 'SIGNAUX'),
    Theme('paint', 'MARQUES_ROUTIERES'),
    Theme('chantier', 'VOIE_PUBLIC'),
    Theme('priorites', 'PRIORITES'),
    Theme('pieton', 'USAGERS_FAIBLES'),
    Theme('train4', 'AUTRES_USAGERS'),
    Theme('vitesse', 'VITESSE'),
    Theme('depacement', 'CROISEMENT_DEPACEMENT'),
    Theme('direction', 'PARTAGER_ROUTE'),
    Theme('escargot', 'ZONE_LENTE'),
    Theme('lieu', 'OU_CIRCULER'),
    Theme('autoroute', 'ROUTES_AUTOROUTES'),
    Theme('stopss', 'INTERDICTION'),
    Theme('accident', 'PANNE_ACCIDENT'),
    Theme('pas_alcool', 'ALCOOL_IMPREGNATION'),
    Theme('vest', 'EQUIPEMENTS_GENERAL'),
    Theme('mainvolant', 'TECHNIQUE_CONDUITE'),
    Theme('battery', 'MECANIQUE_VEHICULE'),
    Theme('parkingss', 'ARRET_STATIONEMENT'),
    //Theme('ecologie', 'ECOLOGIE'),
    Theme('ampoule', 'DIVERS'),
  ];

  String chemin = 'assets/profil/martial.jpg' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


    appBar: AppBar(
      automaticallyImplyLeading: false,

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
