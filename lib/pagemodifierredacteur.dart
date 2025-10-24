import 'package:activite1/Components/myappbar.dart';
import 'package:activite1/Components/mytextbutton.dart';
import 'package:activite1/Components/mytextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModifierRedacteurPage extends StatefulWidget {
  const ModifierRedacteurPage(
      {super.key, required this.redacteurId, required this.redacteurData});

  final String redacteurId;
  final Map<String, dynamic> redacteurData;

  @override
  State<ModifierRedacteurPage> createState() => _ModifierRedacteurPageState();
}

class _ModifierRedacteurPageState extends State<ModifierRedacteurPage> {
  //firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Firestore save
  Future<void> _enregistrerModifications() async {
    await firestore.collection('redacteurs').doc(widget.redacteurId).update({
      'name': _nameController.text,
      'specialty': _specialtyController.text,
    });

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Succès'),
            content: const Text('Rédacteur modifié avec succès!'),
            actions: [
              TextButton(
                onPressed: () {
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

  //controllers
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _specialtyController = TextEditingController();

  //state initialization
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.redacteurData['name']);
    _specialtyController =
        TextEditingController(text: widget.redacteurData['specialty']);
  }

  //disposing of controllers
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _specialtyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Modifier Rédacteur'),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Icon(
            CupertinoIcons.person_fill,
            color: Colors.grey.shade500,
            size: 100,
          ),
          const SizedBox(
            height: 50,
          ),
          MyTextfield(
              textfieldtitle: 'Nom', textfieldController: _nameController),
          const SizedBox(
            height: 20,
          ),
          MyTextfield(
              textfieldtitle: 'Spécialité',
              textfieldController: _specialtyController),
          const SizedBox(
            height: 50,
          ),
          MyTextButton(
              onTap: () => _enregistrerModifications(),
              ButtonText: 'Enregistrer les modifications',
              ButtonHeight: 40,
              ButtonWidth: 100)
        ],
      ),
    );
  }
}
