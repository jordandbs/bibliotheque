import 'package:bibliotheque/model/Auteur.dart';

class Livre {
  late int? _idLivre;
  late String _nomLivre;
  late Auteur _auteur;

  Livre({int? idLivre, required String nomLivre, required Auteur auteur ,})
      : _idLivre = idLivre,
        _nomLivre = nomLivre,
        _auteur = auteur;


  // Getters
  int? get idLivre => _idLivre;
  String get nomLivre => _nomLivre;
  Auteur get auteur => _auteur;
  String get nomAuteur => _auteur.nomAuteur;
  int get idAuteur => _auteur.idAuteur;

  // Setters
  set nomLivre(String value) {
    if (value.isEmpty) {
      throw Exception('Le nom du livre ne peut pas être vide !');
    }
    _nomLivre = value;
  }

  // Convertir un Livre en Map
  Map<String, dynamic> toMap() {
    return {
      'idLivre': _idLivre,
      'nomLivre': _nomLivre,
      'idAuteur': _auteur.idAuteur,
    };
  }

  // Méthode pour créer un livre à partir d'un Map (depuis BDD)
  factory Livre.fromMap(Map<String, dynamic> map) {
    return Livre(
      idLivre: map['idLivre'],
      nomLivre: map['nomLivre'],
      auteur: map['idAuteur'],
    );
  }
}