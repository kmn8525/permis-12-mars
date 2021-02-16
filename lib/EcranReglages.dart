import 'package:flutter/material.dart';

class EcranReglages extends StatefulWidget {
  @override
  _EcranReglagesState createState() => _EcranReglagesState();
}

class _EcranReglagesState extends State<EcranReglages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Reglages'),
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
