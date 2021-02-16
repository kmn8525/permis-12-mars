import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permis/EcranProfil.dart';
import 'package:provider/provider.dart';
import 'Constantes.dart';
import 'Acceuil.dart';
import 'EcranResultats.dart';
import 'EcranQuestions.dart';

import 'EcranThemes.dart';
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
          ChangeNotifierProvider(create: (_) => EcranQuestionsState()),
          ChangeNotifierProvider(create: (_) => EcranThemeState()),
          ChangeNotifierProvider(create: (_) => EcranProfilState()),


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



