class Question {
  String  id ;
  String questionText;
  bool reponse_A;
  bool reponse_B;
  bool reponse_C;
  bool fauteGrave;
  String explication;
  int point ;
  String cheminImage ;
  int numeroImage ;





  Question.Q2(String i , String q, bool x , bool y ,bool z , bool g , String e , int p , String img , int num_img  ) {
    id = i ;
    questionText = q;
    reponse_A = x;
    reponse_B = y ;
    reponse_C = z ;
    fauteGrave = g ;
    explication = e ;
    point = p ;
    cheminImage = img ;
    numeroImage =  num_img ;

  }

  Question.Q1(String i , String q, bool x , bool y ,bool z , bool g , String e , int p    ) {
    id = i ;
    questionText = q;
    reponse_A = x;
    reponse_B = y ;
    reponse_C = z ;
    fauteGrave = g ;
    explication = e ;
    point = p ;


  }

  @override toString() =>  ' /// id - questionText - reponse_A - reponse_B - reponse_C - fauteGrave - explication:'
      '$id.  $questionText .$reponse_A .$reponse_B .$reponse_C . $fauteGrave .$explication' ;



}


