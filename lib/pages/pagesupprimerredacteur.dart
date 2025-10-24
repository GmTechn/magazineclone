import 'package:activite1/Components/myappbar.dart';
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
        // ignore: use_build_context_synchronously
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

  //button style
  final ButtonStyle _styleButton = ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      shadowColor: Colors.redAccent.shade700,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Supprimer Rédacteur'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // centre horizontalement
          children: [
            const Spacer(),
            const Text(
              'Êtes-vous sûre de vouloir supprimer ce rédacteur?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => _supprimerRedacteur(),
              style: _styleButton,
              child: const Text(
                'Supprimer',
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
