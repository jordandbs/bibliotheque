import 'Database.dart';

class AuteurDatabase {
  final DatabaseClient _dbClient = DatabaseClient();

  Future<int> aiouterAuteur(String nomAuteur) async {
    final db = await _dbClient.database;
    return await db.insert('AUTEUR', {
      'nomAuteur': nomAuteur,
    });
  }

//récupérer tous les auteurs
  Future<List<Map<String, dynamic>>> obtenirTousLesAuteurs() async {
    final db = await _dbClient.database;
    return await db.query('AUTEUR');
  }

  //maj auteur
  Future<int> mettreAJourAuteur(int idAuteur, String nomAuteur) async {
    final db = await _dbClient.database;
    return await db.update(
      'AUTEUR',
      {'nomAuteur': nomAuteur},
      where: 'idAuteur = ?',
      whereArgs: [idAuteur],
    );
  }

//supprimer auteur
  Future<int> supprimerAuteur(int idAuteur) async {
    final db = await _dbClient.database;
    return await db.delete(
        'AUTEUR', where: 'idAuteur = ?', whereArgs: [idAuteur]);
  }
//liste alphabétique auteurs
  Future<List<Map<String, dynamic>>> obtenirAuteursParOrdreAlphabetique() async {
    final db = await _dbClient.database;
    return await db.query('AUTEUR', orderBy: 'nomAuteur ASC');
  }

  //récupérer un auteur
  Future<List<Map<String, dynamic>>> obtenirLivresParAuteur(int idAuteur) async {
    final db = await _dbClient.database;
    return await db.query('LIVRE', where: 'idAuteur = ?', whereArgs: [idAuteur]);
  }
}