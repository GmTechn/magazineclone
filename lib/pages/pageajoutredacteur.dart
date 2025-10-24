import 'package:activite1/Components/myappbar.dart';
import 'package:activite1/Components/mytextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AjoutRedacteur extends StatefulWidget {
  const AjoutRedacteur({super.key});

  @override
  State<AjoutRedacteur> createState() => _AjoutRedacteurState();
}

class _AjoutRedacteurState extends State<AjoutRedacteur> {
  //generating the textform key
  final _formKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();

  //button style
  final ButtonStyle _stylebutton = ElevatedButton.styleFrom(
    backgroundColor: Colors.pink.shade200,
    foregroundColor: Colors.black54,
    elevation: 20,
    shadowColor: Colors.pink,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  //instanciating firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //adding a user to firestore
  Future<void> _ajouterRedacteur() async {
    await firestore.collection('redacteurs').add({
      'name': _nameController.text,
      'specialty': _specialtyController.text,
    });
    _nameController.clear();
    _specialtyController.clear();

    return showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Succès'),
            content: const Text('Rédacteur ajouté avec succès!'),
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
      appBar: const MyAppBar(title: 'Ajouter Rédacteur'),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  textfieldtitle: 'Nom',
                  textfieldController: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez insérer un rédacteur!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  textfieldtitle: 'Specialité',
                  textfieldController: _specialtyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez insérer une spécialité!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _ajouterRedacteur();
                    }
                  },
                  style: _stylebutton,
                  child: const Text('Ajouter Rédacteur'),
                ),
              ],
            ),
          )),
    );
  }
}
