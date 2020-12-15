import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Constantes.dart';
class BouttonImageText extends StatelessWidget {
  BouttonImageText({ this.imageSVG , this.nomTheme }) ;
  final String imageSVG ;
  final String nomTheme ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,


      children: <Widget> [
        Container(
          margin: EdgeInsets.all(3),

          child: Column(

            children: <Widget>[

              Container(
                child: SvgPicture.asset(
                  'assets/iconTheme/$imageSVG.svg',

                  height: 50.0,
                  width: 50.0,
                  allowDrawingOutsideViewBox: true,

                ),
                //alignment: Alignment(-1.6, 0),
                // margin: EdgeInsets.all(5),
                //margin: const EdgeInsets.symmetric( vertical : 1 , horizontal: 10),


              ),

              //  alignment: Alignment(-1.6, 0),


              Center(
                // margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                //margin: const EdgeInsets.symmetric( vertical : 1 , horizontal: 5),
                child: Text(
                  nomTheme ,
                  style: kStyletexteButon ,
                  textAlign: TextAlign.center,

                ),
              ),



            ] ,

          ),
        ),



      ],

    );
  }
}

