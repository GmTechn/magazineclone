import 'package:activite1/pageajoutredacteur.dart';
import 'package:activite1/pageredacteurinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink.shade200,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.person_add_solid,
              color: Colors.pink.shade300,
            ),
            title: const Text('Ajouter un Rédacteur'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AjoutRedacteur()));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RedacteurInfoPage()));
            },
            leading: Icon(
              CupertinoIcons.doc_person_fill,
              color: Colors.pink.shade300,
            ),
            title: const Text('Informations des Rédacteurs'),
          ),
        ],
      ),
    );
  }
}
