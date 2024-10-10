import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart';
import '../../model/Auteur.dart';

class ModifierAuteurView extends StatelessWidget {
  final Auteur auteur;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomAuteurController = TextEditingController();

  ModifierAuteurView({required this.auteur});

  @override
  Widget build(BuildContext context) {
    _nomAuteurController.text = auteur.nomAuteur!;

    return Scaffold(
      appBar: AppBar(title: Text('Modifier l\'Auteur')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomAuteurController,
                decoration: InputDecoration(labelText: 'Nom de l\'Auteur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom d\'auteur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<AuteurViewModel>(context, listen: false)
                        .mettreAJourAuteur(auteur.idAuteur!, _nomAuteurController.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Mettre à jour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}