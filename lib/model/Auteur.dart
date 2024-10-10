class Auteur {
  int? _idAuteur = 0;
  String _nomAuteur = '';

  Auteur({required int? idAuteur, required String? nomAuteur}) {
    _idAuteur = idAuteur;
    _nomAuteur = nomAuteur!;
  }

  int? get idAuteur => _idAuteur;
  String get nomAuteur => _nomAuteur;

  set nomAuteur(String? nomAuteur) {
    _nomAuteur = nomAuteur!;
  }

//map convertie pour la bdd
  Map<String, dynamic> toMap() {
    return {
      'idAuteur': _idAuteur,
      'nomAuteur': _nomAuteur,
    };
  }

  // Méthode de map
  factory Auteur.fromMap(Map<String, dynamic> map) {
    return Auteur(
      idAuteur : map['idAuteur'],
      nomAuteur : map['nomAuteur'],
    );
  }
}