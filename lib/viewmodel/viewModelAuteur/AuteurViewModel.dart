import 'package:flutter/foundation.dart';
import '../../model/Auteur.dart';
import '../../repository/AuteurDatabase.dart';

class AuteurViewModel with ChangeNotifier {

  final AuteurDatabase _auteurDb = AuteurDatabase();
  List<Auteur> _auteurs = [];
  List<Auteur> get auteurs => _auteurs;

  Future<void> chargerAuteurs() async {
    final List<Map<String, dynamic>> auteursMap = await _auteurDb.obtenirTousLesAuteurs();
    _auteurs = auteursMap.map((map) => Auteur.fromMap(map)).toList();
    notifyListeners();
  }

  Future<void> ajouterAuteur(String nomAuteur) async {
    await _auteurDb.aiouterAuteur(nomAuteur);
    await chargerAuteurs();
  }

  Future<void> mettreAJourAuteur(int idAuteur, String nomAuteur) async {
    await _auteurDb.mettreAJourAuteur(idAuteur, nomAuteur);
    await chargerAuteurs();
  }

  Future<void> supprimerAuteur(int idAuteur) async {
    await _auteurDb.supprimerAuteur(idAuteur);
    await chargerAuteurs();
  }
}