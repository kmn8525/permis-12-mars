
import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({this.icon});

  final IconData icon;
 //final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),

      ],
    );
  }
}
