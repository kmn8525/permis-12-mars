import 'package:flutter/foundation.dart';
import 'Utility.dart';

class NomProfil with  ChangeNotifier {


   String nom  ;

  NomProfil({ this.nom});

   String get NomPersonne {

     return  nom;

   }



   void  ModifierNomProfil  (String donne_modifier) {
     print(' 1------Utility.addStringToSF noel ') ;


   // nom = donne_modifier ;
     print('2-------- g ') ;



    notifyListeners();

  }



}

