import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ModifierLivreView.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';

class LivreListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<LivreViewModel>(context, listen: false).chargerLivres();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Livres'),
      ),
      body: Consumer<LivreViewModel>(
        builder: (context, livreViewModel, child) {

          return ListView.builder(
            itemCount: livreViewModel.livres.length,
            itemBuilder: (context, index) {
              final livre = livreViewModel.livres[index];
              return ListTile(
                title: Text(livre.nomLivre),
                subtitle: Text('Auteur ID: ${livre.idAuteur}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModifierLivreView(livre: livre),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<LivreViewModel>(context, listen: false)
                            .supprimerLivre(livre.idLivre!);
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