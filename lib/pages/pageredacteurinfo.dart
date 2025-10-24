import 'package:activite1/Components/myappbar.dart';
import 'package:activite1/pages/pagemodifierredacteur.dart';
import 'package:activite1/pages/pagesupprimerredacteur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RedacteurInfoPage extends StatelessWidget {
  const RedacteurInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    //firebase instance generation
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
        appBar: const MyAppBar(title: 'Informations Rédacteurs'),
        //stream builder to listen to database
        //in real time
        body: StreamBuilder<QuerySnapshot>(
          //streaming from collection from firestore
          stream: firestore.collection('redacteurs').snapshots(),
          builder: (context, snapshot) {
            //reading the connection state
            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Il y\'a une erreur.'),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('Vous n\'avez aucun rédacteur.'),
              );
            }

            final redacteurs = snapshot.data!.docs;

            return ListView.builder(
                itemCount: redacteurs.length,
                itemBuilder: (context, index) {
                  final redacteur = redacteurs[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.pink.shade300,
                      child: ListTile(
                        title: Text(redacteur['name']),
                        subtitle: Text(redacteur['specialty']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SupprimerRedacteur(
                                                redacteurId: redacteur.id,
                                              )));
                                },
                                icon: const Icon(
                                  CupertinoIcons.trash_fill,
                                  color: Colors.pink,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ModifierRedacteurPage(
                                                  redacteurId: redacteur.id,
                                                  redacteurData:
                                                      redacteur.data() as Map<
                                                          String, dynamic>)));
                                },
                                icon: const Icon(
                                  CupertinoIcons.pencil,
                                  color: Colors.pink,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
