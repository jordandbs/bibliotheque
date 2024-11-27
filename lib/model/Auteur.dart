import 'package:bibliotheque/model/Livre.dart';

class Auteur {
  late int _idAuteur;
  late String _nomAuteur;
  late List<Livre> _listeLivreAuteur;

  Auteur({required idAuteur, required nomAuteur, required List<Livre> listeLivreAuteur}) {
    _idAuteur = idAuteur;
    _nomAuteur = nomAuteur;
    _listeLivreAuteur = listeLivreAuteur ?? [];
  }

  int get idAuteur => _idAuteur;

  set idAuteur(int value) {
    _idAuteur = value;
  }

  String get nomAuteur => _nomAuteur;

  set nomAuteur(String value) {
    _nomAuteur = value;
  }

  List<Livre> get listeLivreAuteur => _listeLivreAuteur;

  set listeLivreAuteur(List<Livre> value) {
    _listeLivreAuteur = value;
  }

  //Ajouter un livre à la liste
  void ajouterLivre(Livre livre) {
    _listeLivreAuteur.add(livre);
  }

  //Supprimer un livre de la liste
  void supprimerLivre(Livre livre) {
    _listeLivreAuteur.remove(livre);
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
      listeLivreAuteur : map['listeLivreAuteur'],
    );
  }
}