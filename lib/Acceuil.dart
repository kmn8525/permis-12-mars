
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'EcranCours.dart';
import 'EcranExamen.dart';
import 'EcranJeux.dart';
import 'EcranReglages.dart';
import 'BasBarNavigation.dart';
import 'TableIthemes.dart';
import 'EcranThemes.dart';


class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();

}



class _AccueilState extends State<Accueil> {

  int _selectedIndex = 0;
  final List<Widget> _children = [
    EcranTheme(),
    EcranCours(),
    EcranExamen(),
    EcranJeux(),
    EcranReglages(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? cupertino() : material();
  }

  Widget material() {
    ThemeData(
      backgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.grey[200],
    );
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Theme'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Cours'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),

            backgroundColor: Colors.white,
            title: Text('Examen'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            title: Text('Jeux'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Reglage'),
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget cupertino() {

    return CupertinoTabScaffold(

        tabBar: CupertinoTabBar(
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
            backgroundColor: Colors.grey,

            items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('theme'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Cours'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),

            backgroundColor: Colors.white,
            title: Text('Examen'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            title: Text('Jeux'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Reglage'),
          ),

        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return EcranTheme();
              break;
            case 1:
              return EcranCours();
              break;
            case 2:
              return EcranExamen();
              break;
            case 3:
              return EcranJeux();
              break;
            default:
              return EcranReglages();
              break;
          }
        });
  }

}










