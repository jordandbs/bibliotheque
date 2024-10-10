import 'package:bibliotheque/viewmodel/viewModelAuteur/AjouterAuteurView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart';
import 'ModifierAuteurView.dart';

class AuteurListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuteurViewModel>(context, listen: false).chargerAuteurs();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Auteurs'),
      ),
      body: Consumer<AuteurViewModel>(
        builder: (context, auteurViewModel, child) {

          return ListView.builder(
            itemCount: auteurViewModel.auteurs.length,
            itemBuilder: (context, index) {
              final auteur = auteurViewModel.auteurs[index];
              return ListTile(
                title: Text(auteur.nomAuteur!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModifierAuteurView(auteur: auteur),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<AuteurViewModel>(context, listen: false)
                            .supprimerAuteur(auteur.idAuteur!);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}