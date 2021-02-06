import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BouttonProfil.dart';
import 'dart:async';

import 'Constantes.dart';
import 'package:flutter_svg/svg.dart';

import 'EcranProfil.dart';
import 'EcranQuestions.dart';
import 'package:permis/BouttonProfil.dart';

import 'ListeResultats.dart';
import 'VerticalItem.dart';


final String titrePage='EcranThemes' ;


class EcranTheme extends StatefulWidget {
  static  const String id = 'EcranThemes' ;


  @override
  EcranThemeState createState() => EcranThemeState();
}


class Theme {
  Theme(this.NomImageSVG, this.nomTheme);

  final String NomImageSVG;

  final String nomTheme ;


}

class EcranThemeState extends State<EcranTheme>  with ChangeNotifier , SingleTickerProviderStateMixin{

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500) * 5, () {
      if (!mounted) {
        return;
      }
      setState(() {
        //_themes.length += 10;
      });
    });
    super.initState();
  }
  List<Theme> _themes = [
    Theme('informations', 'DEFINITION'),
    Theme('conducteur', 'CONDUCTEUR'),
    Theme('policiere', 'INJONCTIONS'),
    Theme('feuxControl', 'FEUX'),
    Theme('danger', 'SIGNAUX'),
    Theme('SIGNAUX', 'SIGNAUX_DUREE'),
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
    Theme('ecologie', 'ECOLOGIE'),

    //Theme('ecologie', 'ECOLOGIE'),
    Theme('ampoule', 'DIVERS'),

  ];





  String chemin = 'assets/profil/martial.jpg' ;
  String themeChoisi ;

  String  utilisateurTheme( String tmp) {

    themeChoisi = tmp ;

    notifyListeners() ;

    return themeChoisi ;
  }


  @override
  void dispose() {
    super.dispose();

  }

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
                  Provider.of<Resultats>(context , listen: false).afficheListe();

                  Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                      builder: (BuildContext context  ) =>
                          EcranProfil()));

                },

              ) ,
            ) ,
          ],

        ),
        backgroundColor: kCouleurAppBar ,
      ),


      body:  SafeArea(
        child: Center(

          child: LiveGrid(
            padding: EdgeInsets.fromLTRB(0 , 6 , 0 , 6),
            showItemInterval: Duration(milliseconds: 50),
            showItemDuration: Duration(milliseconds: 150),
            visibleFraction: 0.001,
            itemCount: _themes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: animationItemBuilder(
                    (index) => HorizontalItem( NomImageSVG : _themes[index].NomImageSVG , nomTheme : _themes[index].nomTheme  )),



          ),
        ),
      ),

    );

  }


}
