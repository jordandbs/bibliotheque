import 'Database.dart';

class AuteurDatabase {
  final DatabaseClient _dbClient = DatabaseClient();

  Future<int> aiouterAuteur(String nomAuteur) async {
    final db = await _dbClient.database;
    return await db.insert('AUTEUR', {
      'nomAuteur': nomAuteur,
    });
  }

  Future<List<Map<String, dynamic>>> obtenirTousLesAuteurs() async {
    final db = await _dbClient.database;
    return await db.query('AUTEUR');
  }

  Future<int> mettreAJourAuteur(int idAuteur, String nomAuteur) async {
    final db = await _dbClient.database;
    return await db.update(
      'AUTEUR',
      {'nomAuteur': nomAuteur},
      where: 'idAuteur = ?',
      whereArgs: [idAuteur],
    );
  }

  Future<int> supprimerAuteur(int idAuteur) async {
    final db = await _dbClient.database;
    return await db.delete(
        'AUTEUR', where: 'idAuteur = ?', whereArgs: [idAuteur]);
  }

  Future<List<Map<String, dynamic>>> obtenirAuteursParOrdreAlphabetique() async {
    final db = await _dbClient.database;
    return await db.query(
        'AUTEUR'
        , orderBy: 'nomAuteur ASC');
  }
}