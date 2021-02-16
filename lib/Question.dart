class Question {
  String questionText;
  bool reponse_A;
  bool reponse_B;
  bool reponse_C;
  String fauteGrave;
  String explication;





  Question(String q, bool x , bool y ,bool z , String g , String e ) {

    questionText = q;
    reponse_A = x;
    reponse_B = y ;
    reponse_C = z ;
    fauteGrave = g ;
    explication = e ;


  }

  @override toString() => 'questionText - reponse_A - reponse_B - reponse_C - fauteGrave - explication:'
      ' $questionText .$reponse_A .$reponse_B .$reponse_C . $fauteGrave .$explication' ;



}


