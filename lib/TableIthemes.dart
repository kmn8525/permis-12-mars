
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const  reglages = IconData(0xe900 , fontFamily: 'reglages' ) ;
const  cours = IconData(0xe900 , fontFamily: 'cours' ) ;
const  jeux = IconData(0xe900 , fontFamily: 'jeux' ) ;
const  theme = IconData(0xe900 , fontFamily: 'themes' ) ;
const  examen = IconData(0xe900 , fontFamily: 'chrono' ) ;


enum TableItems  { themes, cours, examens , jeux, reglages}

class TableItemDonne {
  const TableItemDonne({@required this.nom, @required this.icon});

  final String nom;
  final IconData icon;



  static const Map<TableItems, TableItemDonne> TousLesTableDitem = {
    TableItems.themes: TableItemDonne(nom: 'Thèmes', icon: theme),
    TableItems.cours: TableItemDonne(nom: 'Cours', icon: cours),
    TableItems.examens: TableItemDonne(nom: 'Examen', icon: examen),
    TableItems.jeux: TableItemDonne(nom: 'Jeux', icon: jeux),
    TableItems.reglages: TableItemDonne(nom: 'Réglages', icon: reglages),

  };
}


