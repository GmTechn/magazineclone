import 'package:activite1/gestion.dart';
import 'package:activite1/pageacceuil.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magazine',
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => PageAcceuil(),
        '/usermanager': (context) => GestionRedacteurs(),
      },
    );
  }
}
