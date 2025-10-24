import 'package:activite1/pageacceuil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  ///ceci permet de s’assurer que le moteur Flutter
  /// est initialisé correctement avant d’exécuter d’autres
  /// opérations comme l’initialisation de Firebase.

  WidgetsFlutterBinding.ensureInitialized();

  ///initializinf firebase in our app
  ///app will await for this before launching
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magazine',
      home: PageAcceuil(),

      // initialRoute: '/homepage',
      // routes: {
      //   '/homepage': (context) => PageAcceuil(),
      //   '/usermanager': (context) => GestionRedacteurs(),
      // },
    );
  }
}
