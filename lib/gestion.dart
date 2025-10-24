import 'package:activite1/Components/mytextfield.dart';
import 'package:activite1/Modele/redacteur.dart';
import 'package:activite1/dbmanager.dart';
import 'package:activite1/pageAcceuil.dart';
import 'package:flutter/material.dart';

class GestionRedacteurs extends StatefulWidget {
  const GestionRedacteurs({super.key});

  @override
  State<GestionRedacteurs> createState() => _GestionRedacteursState();
}

class _GestionRedacteursState extends State<GestionRedacteurs> {
// Create controllers for each text field
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

//list to store added users

  List<Redacteur> _users = [];

//Management of the database

  final DatabaseManager _dbManager = DatabaseManager();

  @override
//initialisation de la DB so that the state is always initialized at login

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
    await _dbManager.initialisation();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await _dbManager.getAllRedacteur();
    setState(() {
      _users = users;
    });
  }

  //adding user from texteditting contoller

  Future<void> _addUser() async {
    if (fnameController.text.isEmpty ||
        lnameController.text.isEmpty ||
        emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.pink.shade50,
            content: const Text(
              'Veuillez remplir toutes les zonnes de saisie.',
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      );
      return;
    }
    final newUser = Redacteur(
        id: null,
        fname: fnameController.text,
        lname: lnameController.text,
        email: emailController.text);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pink.shade50,
          content: const Text(
            'Utilisateur ajouté avec succès.',
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );

    await _dbManager.insertRedacteur(newUser);
    await _loadUsers();

    //clear fields after adding name to database

    fnameController.clear();
    lnameController.clear();
    emailController.clear();
  }

  //delete user from the list of users
  Future<void> _deleteUser(Redacteur user) async {
    final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 255, 241, 245),
              title: const Text(
                'Supprimer un Rédacteur',
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                'Voulez-vous vraiment supprimer ${user.fname}?',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Supprimer",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ],
            ));

    if (confirm == true) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.pink.shade50,
            content: const Text(
              'Utilisateur supprimé avec succès.',
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      );
      await _dbManager.deleteRedacteur(user.id!);
      _loadUsers();
    }
  }

  //editting a user from the list of users

  Future<void> _editUser(Redacteur user) async {
    final TextEditingController newFname =
        TextEditingController(text: user.fname);
    TextEditingController newLname = TextEditingController(text: user.lname);
    TextEditingController newEmail = TextEditingController(text: user.email);

    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 255, 241, 245),
              title: const Text('Modifier Rédacteur'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTextfield(
                      textfieldtitle: 'Nouveau Nom',
                      textfieldController: newLname),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextfield(
                      textfieldtitle: 'Nouveau Prénom',
                      textfieldController: newFname),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextfield(
                      textfieldtitle: 'Nouvel Email',
                      textfieldController: newEmail),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () async {
                      final updatedUser = Redacteur(
                          id: user.id,
                          fname: newFname.text,
                          lname: newLname.text,
                          email: newEmail.text);

                      await _dbManager.updateRedacteur(updatedUser);

                      Navigator.pop(context);
                      _loadUsers();
                    },
                    child: const Text(
                      'Enregistrer',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ))
              ],
            ));
  }

  void dispose() {
    // Always dispose controllers to avoid memory leaks
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageAcceuil()));
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        title: const Text(
          'Gestion des Rédacteurs',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Icon(
            Icons.person,
            color: Colors.grey.shade600,
            size: 100,
          ),
          const SizedBox(height: 10),
          Text(
            'Gérez ici vos rédacteurs',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),

          // Correctly passing TextEditingControllers
          MyTextfield(
            textfieldtitle: 'Nom',
            textfieldController: fnameController,
          ),
          const SizedBox(height: 10),
          MyTextfield(
            textfieldtitle: 'Prénom',
            textfieldController: lnameController,
          ),
          const SizedBox(height: 10),
          MyTextfield(
            textfieldtitle: 'Email',
            textfieldController: emailController,
          ),
          const SizedBox(height: 20),

          Container(
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton.icon(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: _addUser,
              label: const Text(
                'Add a user',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
              child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: const Color.fromARGB(255, 255, 235, 242),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          title: Text('${user.fname} ${user.lname}'),
                          subtitle: Text(user.email),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () => _deleteUser(user),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.pink,
                                  )),
                              IconButton(
                                  onPressed: () => _editUser(user),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.pink,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
