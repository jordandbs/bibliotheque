import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart';

class AjouterLivreView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomLivreController = TextEditingController();
  String? _selectedAuteurId;

  @override
  Widget build(BuildContext context) {
    Provider.of<AuteurViewModel>(context, listen: false).chargerAuteurs();

    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un Livre')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomLivreController,
                decoration: InputDecoration(labelText: 'Nom du Livre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du livre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Consumer<AuteurViewModel>(
                builder: (context, auteurViewModel, child) {

                  return DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Sélectionnez un Auteur'),
                    value: _selectedAuteurId,
                    items: auteurViewModel.auteurs.map((auteur) {
                      return DropdownMenuItem<String>(
                        value: auteur.idAuteur.toString(),
                        child: Text(auteur.nomAuteur),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      _selectedAuteurId = newValue;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Veuillez sélectionner un auteur';
                      }
                      return null;
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nomLivre = _nomLivreController.text;
                    final idAuteur = int.parse(_selectedAuteurId!);

                    Provider.of<LivreViewModel>(context, listen: false)
                        .ajouterLivre(nomLivre, idAuteur)
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Livre ajouté avec succès!')),
                      );
                      Navigator.pop(context);
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erreur lors de l\'ajout du livre')),
                      );
                    });
                  }
                },
                child: Text('Ajouter le Livre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}