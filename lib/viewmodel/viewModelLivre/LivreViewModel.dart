import 'package:flutter/foundation.dart';
import '../../repository/LivreDatabase.dart';
import '../../model/Livre.dart';

class LivreViewModel with ChangeNotifier {
  final LivreDatabase _livreDb = LivreDatabase();
  List<Livre> _livres = [];

  List<Livre> get livres => _livres;

  Future<void> chargerLivres() async {
    final List<Map<String, dynamic>> livresMap = await _livreDb.obtenirTousLesLivres();
    _livres = livresMap.map((map) => Livre.fromMap(map)).toList();
    notifyListeners();
  }

  Future<void> ajouterLivre(String nomLivre, int idAuteur) async {
    await _livreDb.ajouterLivre(nomLivre, idAuteur);
    await chargerLivres();
  }

  Future<void> mettreAJourLivre(int idLivre, String nomLivre, int idAuteur) async {
    await _livreDb.mettreAJourLivre(idLivre, nomLivre, idAuteur);
    await chargerLivres();
  }

  Future<void> supprimerLivre(int idLivre) async {
    await _livreDb.supprimerLivre(idLivre);
    await chargerLivres();
  }
}