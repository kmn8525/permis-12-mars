import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Option.dart';
import 'Question.dart';

class Resultats extends ChangeNotifier {



  List<Question> _listeQuestionsUtilisateurs = [] ;

  List<Option> _listeDeChoixUtilisateurs = [ ] ;

  List _listColoueurSolution = [ ] ;

  List _listSelectionA = [ ] ;
  List _listSelectionB = [ ] ;
  List _listSelectionC = [ ] ;

  List _listColoueurBoutonA = [ ] ;
  List _listColoueurBoutonB = [ ] ;
  List _listColoueurBoutonC = [ ] ;

  List _listChoixUtilisateur = [ ] ;
  List _listTotalPoint = [ ] ;


    void SuprimerLesResultat() {
      _listeQuestionsUtilisateurs.clear()  ;
      _listeDeChoixUtilisateurs.clear()  ;
      _listColoueurSolution.clear();
      _listSelectionA.clear();
      _listSelectionB.clear();
      _listSelectionC.clear();
      _listColoueurBoutonA.clear();
      _listColoueurBoutonB.clear();
      _listColoueurBoutonC.clear();
      _listChoixUtilisateur.clear();
      _listTotalPoint.clear();
    }



  Color getColoueurBoutonA (int indexCourant) {

    return _listColoueurBoutonA[indexCourant] ;

  }

  Color getColoueurBoutonB (int indexCourant) {

    return _listColoueurBoutonB[indexCourant] ;

  }


  Color getColoueurBoutonC (int indexCourant) {

    return _listColoueurBoutonC[indexCourant] ;

  }

  Color getColoueurSelectionA (int indexCourant) {

    print('indexCourant $indexCourant') ;
    print('_listSelectionA') ;
    print(_listSelectionA);
    return _listSelectionA[indexCourant] ;

  }

  Color getColoueurSelectionB (int indexCourant) {

    return _listSelectionB[indexCourant] ;

  }

  Color getColoueurSelectionC (int  indexCourant) {

    return _listSelectionC[ indexCourant] ;

  }



  void ajouterColoueurBoutonC (  Color couleur){

    _listColoueurBoutonC.add(couleur);
    notifyListeners() ;


  }

  void ajouterColoueurBoutonB(  Color couleur){

    _listColoueurBoutonB.add(couleur);
    notifyListeners() ;


  }

  void ajouterColoueurBoutonA(  Color couleur){

    _listColoueurBoutonA.add(couleur);
    notifyListeners() ;


  }
void ajouterCouleurResultats(  Color couleur){

  _listColoueurSolution.add(couleur);
  notifyListeners() ;


}


  void ajouterColoueurSelectionA (  Color couleur){

    _listSelectionA.add(couleur);
    notifyListeners() ;


  }

  void ajouterColoueurSelectionB (  Color couleur){

    _listSelectionB.add(couleur);
    notifyListeners() ;


  }


  void ajouterColoueurSelectionC ( Color couleur){

    _listSelectionC.add(couleur);
    notifyListeners() ;


  }

  void ajouterQuestion( String idQuestion , String nouvelQuestion , bool choixA , bool choixB , bool choixC , bool nouvelFaute ,  String nouvelExplication , int nouveauPoint ){


    final tampon =  Question.Q1(idQuestion , nouvelQuestion , choixA , choixB ,  choixC , nouvelFaute , nouvelExplication , nouveauPoint)  ;
    _listeQuestionsUtilisateurs.add(tampon) ;
    notifyListeners() ;


  }

  void ajouterReponse(  String idChoix ,  String reponseA , String reponseB ,  String reponseC ){

  final tampon = Option( idChoix , reponseA , reponseB , reponseC ) ;
  _listeDeChoixUtilisateurs.add(tampon) ;
  notifyListeners() ;

}

  void ajouterTotal(   int total ){


    _listTotalPoint.add(total) ;
    notifyListeners() ;

  }





List listeQuestionResultat (){

    return  _listeQuestionsUtilisateurs;
}

  List listeOption (){

    return  _listeDeChoixUtilisateurs ;
  }

  List listeCouleur (){

    return  _listColoueurSolution;
  }

  List ListeChoixUtilisateurs (){

    return  _listChoixUtilisateur;
  }


  int getTaille(){
    return _listeQuestionsUtilisateurs.length ;
  }



  ////----- Getter Question --- ////

  String getQuestionText(int indexCourant) {

    return _listeQuestionsUtilisateurs[indexCourant].questionText;

  }




  bool getFauteGrave(int indexCourant) {


    return _listeQuestionsUtilisateurs[indexCourant].fauteGrave;
  }


  String getExplication(int indexCourant) {

    return _listeQuestionsUtilisateurs[indexCourant].explication;
  }

  int getPoint(int indexCourant) {

    return _listeQuestionsUtilisateurs[indexCourant].point;
  }


  //// ==== GETTER  OPTION ==== ////

  String getOptionA(int indexCourant) {

    return _listeDeChoixUtilisateurs[indexCourant].option_A;

  }


  String getOptionB(int indexCourant) {

    return _listeDeChoixUtilisateurs[indexCourant].option_B;

  }

  String getOptionC(int indexCourant) {

    return _listeDeChoixUtilisateurs[indexCourant].option_C;

  }


  void afficheListe () {
    print( '_listSelectionA $_listSelectionA' ) ;
    print( '_listColoueurBoutonA $_listColoueurBoutonA' ) ;




  }





  void reset() {

    _listeQuestionsUtilisateurs.clear() ;
    _listeDeChoixUtilisateurs.clear() ;
    _listColoueurSolution.clear() ;
    _listSelectionA.clear() ;
    _listSelectionB.clear() ;
     _listSelectionC.clear() ;
     _listColoueurBoutonA.clear() ;
     _listColoueurBoutonB.clear() ;
     _listColoueurBoutonC.clear() ;
     _listChoixUtilisateur.clear() ;

  }





}

