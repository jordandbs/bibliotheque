import 'Auteur.dart';

class Livre {
  int? _idLivre;
  String? _nomLivre;
  int _idAuteur;

  Livre({int? idLivre, required String nomLivre, required int idAuteur})
      : _idLivre = idLivre,
        _nomLivre = nomLivre,
        _idAuteur = idAuteur;

  int? get idLivre => _idLivre;
  String get nomLivre => _nomLivre!;
  int get idAuteur => _idAuteur;

  set nomLivre(String value) {
    _nomLivre = value;
  }

  set idAuteur(int value) {
    _idAuteur = value;
  }


  // convertie pour la bdd (map)
  Map<String, dynamic> toMap() {
    return {
      'idLivre': _idLivre,
      'nomLivre': _nomLivre,
      'idAuteur': _idAuteur,
    };
  }

  // Méthode de map
  factory Livre.fromMap(Map<String, dynamic> map) {
    return Livre(
      idLivre: map['idLivre'],
      nomLivre: map['nomLivre'],
      idAuteur: map['idAuteur'],
    );
  }
}