import 'Database.dart';

class LivreDatabase {
  final DatabaseClient _dbClient = DatabaseClient();

  Future<int> ajouterLivre(String nomLivre, int idAuteur) async {
    final db = await _dbClient.database;
    return await db.insert('LIVRE', {
      'nomLivre': nomLivre,
      'idAuteur': idAuteur,
    });
  }

  Future<List<Map<String, dynamic>>> obtenirTousLesLivres() async {
    final db = await _dbClient.database;
    return await db.query('LIVRE');
  }

  Future<int> mettreAJourLivre(int idLivre, String nomLivre, int idAuteur) async {
    final db = await _dbClient.database;
    return await db.update('LIVRE',
      {'nomLivre': nomLivre, 'idAuteur': idAuteur},
      where: 'idLivre = ?',
      whereArgs: [idLivre],
    );
  }

Future<int> supprimerLivre(int idLivre) async {
  final db = await _dbClient.database;
  return await db.delete(
    'LIVRE',
    where: 'idLivre = ?',
    whereArgs: [idLivre],
  );
}
}