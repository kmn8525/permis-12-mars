
import 'package:flutter/material.dart';

class EcranJeux extends StatefulWidget {
  @override
  _EcranJeuxState createState() => _EcranJeuxState();
}

class _EcranJeuxState extends State<EcranJeux> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Jeux'),
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
