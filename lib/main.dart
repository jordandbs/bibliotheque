import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/viewLivre/LivreListView.dart';
import 'view/viewAuteur/AuteurListView.dart';
import 'view/viewAuteur/AjouterAuteurView.dart';
import 'view/viewLivre/AjouterLivreView.dart';
import 'viewmodel/viewModelLivre/LivreViewModel.dart';
import 'viewmodel/viewModelAuteur/AuteurViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LivreViewModel()),
        ChangeNotifierProvider(create: (_) => AuteurViewModel()),
      ],
      child: MaterialApp(
        title: 'Bibliothèque',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bibliothèque'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Gérer les Auteurs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuteurPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Gérer les Livres'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LivrePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Bienvenue à la Bibliothèque !',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LivrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LivreListView(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjouterLivreView()),
                );
              },
              child: Text('Ajouter un Livre'),
            ),
          ),
        ],
      ),
    );
  }
}

class AuteurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AuteurListView(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjouterAuteurView()),
                );
              },
              child: Text('Ajouter un Auteur'),
            ),
          ),
        ],
      ),
    );
  }
}