import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EcranCours extends StatefulWidget {
  @override
  _EcranCoursState createState() => _EcranCoursState();
}

class _EcranCoursState extends State<EcranCours> {

@override
  void initState() {
     super.initState();
  }

  @override
  void dispose() {
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Cours'),
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
      body: SvgPicture.asset(
        'assets/iconTheme/test.svg',
        height: 700.0,
        width: 700.0,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}
