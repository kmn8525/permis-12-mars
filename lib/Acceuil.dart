
import 'package:flutter/material.dart';
import 'EcranCours.dart';
import 'EcranExamen.dart';
import 'EcranJeux.dart';
import 'EcranReglages.dart';
import 'BasBarNavigation.dart';
import 'TableIthemes.dart';
import 'EcranTheme.dart';


class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();

}



class _AccueilState extends State<Accueil> {

  TableItems _TableActuel = TableItems.themes;

  final Map<TableItems, GlobalKey<NavigatorState>> IdNavigation = {
    TableItems.themes: GlobalKey<NavigatorState>(),
    TableItems.cours: GlobalKey<NavigatorState>(),
    TableItems.examens: GlobalKey<NavigatorState>(),
    TableItems.jeux: GlobalKey<NavigatorState>(),
    TableItems.reglages: GlobalKey<NavigatorState>(),

  };

  Map<TableItems, WidgetBuilder> get widgetConstructeurs {
    return {
      TableItems.themes: (_) => EcranThemes(),
      TableItems.cours: (_) => EcranCours(),
      TableItems.examens: (_) => EcranExamen(),
      TableItems.jeux: (_) => EcranJeux(),
      TableItems.reglages: (_) => EcranReglages(),

    };
  }

  void _choix(TableItems tableItem) {
    if (tableItem == _TableActuel) {
      // pop to first route
      IdNavigation[tableItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _TableActuel = tableItem);
    }
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(

      onWillPop: () async => !await IdNavigation[_TableActuel].currentState.maybePop(),

      child: CupertinoHomeScaffold(
        tableActuel : _TableActuel ,
        tableSelectioner :  _choix ,
        widgetConstructeurs : widgetConstructeurs ,
        IdNavigation : IdNavigation ,

      ),
    );
  }

}
