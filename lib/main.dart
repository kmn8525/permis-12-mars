import 'package:flutter/material.dart';
import 'package:permis/EcranProfil.dart';
import 'package:provider/provider.dart';

import 'Acceuil.dart';
import 'Constantes.dart';
import 'EcranQuestions.dart';
import 'EcranResultats.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'ListeFavoris.dart';
import 'ListeResultats.dart';
import 'NomProfil.dart';

// cleEcranQuestions = GlobalKey<EcranQuestionsState>();





void main() =>
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NomProfil()),
          ChangeNotifierProvider(create: (_) => EcranResultatState()),
          ChangeNotifierProvider(create: (_) => Resultats()),
          ChangeNotifierProvider(create: (_) => Definition.C2()),
          ChangeNotifierProvider(create: (_) => ConducteurPassager.C2()),
          ChangeNotifierProvider(create: (_) => EcranQuestionsState()),
           ChangeNotifierProvider(create: (_) => EcranProfilState()),
            ChangeNotifierProvider(create: (_) => Favoris()),


        ],
        child:  MaterialApp(

          theme: ThemeData(
            primaryColor: kCouleurAppBar,
            scaffoldBackgroundColor: kCouleurBody,
            accentColor: Colors.blue,
          ),

          home: Accueil(),

          ) ,


      ),
    );



