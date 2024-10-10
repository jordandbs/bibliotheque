import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import '../../model/Livre.dart';

class ModifierLivreView extends StatelessWidget {
  final Livre livre;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomLivreController = TextEditingController();

  ModifierLivreView({required this.livre});

  @override
  Widget build(BuildContext context) {
    _nomLivreController.text = livre.nomLivre;

    return Scaffold(
      appBar: AppBar(title: Text('Modifier le livre')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomLivreController,
                decoration: InputDecoration(labelText: 'Nom du livre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom de livre';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<LivreViewModel>(context, listen: false)
                        .mettreAJourLivre(livre.idLivre!, _nomLivreController.text, livre.idAuteur);
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