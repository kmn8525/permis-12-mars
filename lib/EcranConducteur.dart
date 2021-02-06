import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:permis/EcranThemes.dart';

import 'package:permis/ImageText_theme.dart';
import 'Constantes.dart';
import 'package:permis/BouttonQuestion.dart';


Rect myRect = const Offset(100.0, 2.0) & const Size(3.0, 4.0);

class EcranConducteur extends StatelessWidget {
  // EcranDefinition ({ this.SleekCircularSlider}) ;
  final Cercletemps  = SleekCircularSlider(
   min :0 ,
    initialValue: 0,
    max : 100 ,
    appearance: CircularSliderAppearance (
        spinnerMode: true ,
        infoProperties: InfoProperties(),
        angleRange: 300,
        startAngle: 90 ,
        size: 4 ,
        customColors: CustomSliderColors (
            hideShadow: true ,
            dotColor: Colors.transparent ,
            progressBarColors: [Colors.purpleAccent , Colors.deepPurple] ,
            trackColor: Colors.blue ) ,
        customWidths: CustomSliderWidths (
            progressBarWidth: 20.0 , trackWidth: 10.0
        )
    ),

  );
  final slider = SleekCircularSlider(
      min :0 ,
      initialValue: 0,
      max : 5 ,

    appearance: CircularSliderAppearance(
      customWidths: CustomSliderWidths (
          progressBarWidth: 10.0 , trackWidth: 10.0
      ) ,
      animationEnabled : true ,
      spinnerMode: true,
      size : 200.0 ,
        spinnerDuration: 	5000 ,

        animDurationMultiplier : 15 ,
      angleRange: 100 ,


    ));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conducteur Passager :'),
      ),
      body: Container(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container (
                child: slider ,
              ) ,


            ],


          ),
        ),
      ),
      backgroundColor: kCouleurBodyTheme,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.highlight ,
                semanticLabel: 'Explication',

              ),

            ),
            Container(

              child: IconButton(
                onPressed: () { },
                icon: Icon(
                  Icons.share ,
                  semanticLabel: 'Partager',
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        // child:                     slider ,

        onPressed: ( ) {   },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
