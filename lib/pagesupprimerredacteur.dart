import 'package:activite1/Components/myappbar.dart';
import 'package:activite1/Components/mytextbutton.dart';
import 'package:activite1/pageredacteurinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SupprimerRedacteur extends StatefulWidget {
  const SupprimerRedacteur({super.key, required this.redacteurId});
  final String redacteurId;

  @override
  State<SupprimerRedacteur> createState() => _SupprimerRedacteurState();
}

class _SupprimerRedacteurState extends State<SupprimerRedacteur> {
//firebase instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //deleting user
  Future<void> _supprimerRedacteur() async {
    await firestore.collection('redacteurs').doc(widget.redacteurId).delete();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Succès'),
            content: const Text('Rédacteur supprimé avec succès!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Supprimer Rédacteur'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // centre horizontalement
          children: [
            Spacer(),
            const Text(
              'Êtes-vous sûre de vouloir supprimer le rédacteur?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            MyTextButton(
                onTap: () => _supprimerRedacteur(),
                ButtonText: 'Supprimer',
                ButtonHeight: 40,
                ButtonWidth: 100),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
