import 'package:flutter/foundation.dart';


class NomProfil with  ChangeNotifier {


   String nom = 'Entrez Votre Nom' ;

  NomProfil({ this.nom});

   String get NomPersonne {
     return  nom;

   }

   void  ModifierNomProfil  (String donne_modifier) {
    nom = donne_modifier ;
    notifyListeners();

  }



}

