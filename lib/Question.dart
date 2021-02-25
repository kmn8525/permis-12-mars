class Question {
  String questionText;
  bool reponse_A;
  bool reponse_B;
  bool reponse_C;
  bool fauteGrave;
  String explication;
  int point ;





  Question(String q, bool x , bool y ,bool z , bool g , String e , int p ) {

    questionText = q;
    reponse_A = x;
    reponse_B = y ;
    reponse_C = z ;
    fauteGrave = g ;
    explication = e ;
    point = p ;



  }

  @override toString() => 'questionText - reponse_A - reponse_B - reponse_C - fauteGrave - explication:'
      ' $questionText .$reponse_A .$reponse_B .$reponse_C . $fauteGrave .$explication' ;



}


