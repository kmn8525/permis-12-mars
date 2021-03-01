/*

Widget imageEnregistre() {

  return FutureBuilder<File>(
    future: imageFile,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done && snapshot.data != null  ) {

        Utility.saveImageToPreferences( cleImage ,
            Utility.base64String(snapshot.data.readAsBytesSync()));

        return ClipOval(
          child: Image.file(
            snapshot.data,
            width: 90,
            height: 90,
            fit: BoxFit.cover,

          ),


        ) ;
      } else if ( snapshot.error  != null) {
        return const Text(
          'Erreur -> Reception image',
          textAlign: TextAlign.center,
        );
      } else {
        return Container(

        ) ;
      }
    },
  );
}

@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: Utility.instance.getIntegerValue(RcleQD),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return YourFinalWidget();
      }
      return CircularProgressIndicator(); // or some other widget
    },
  );
}




class UserPro extends StatelessWidget{
  final currentUser;

  //String name;
  UserPro({this.currentUser});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context,snapshot){
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Text(
              snapshot.data.getString("name"),
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Berlin Sans FB',
                fontWeight: FontWeight.bold,
              ),
            ),
          },
        ),
      ),
    );
  }
}


*/


































