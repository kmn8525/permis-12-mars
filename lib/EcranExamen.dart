import 'package:flutter/material.dart';

class EcranExamen extends StatefulWidget {
  @override
  _EcranExamenState createState() => _EcranExamenState();
}

class _EcranExamenState extends State<EcranExamen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Examen'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {  },
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
