import 'package:activite1/Components/mydrawer.dart';
import 'package:activite1/Components/mytextbutton.dart';
import 'package:activite1/gestion.dart';
import 'package:flutter/material.dart';

class PageAcceuil extends StatelessWidget {
  const PageAcceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Magazine Infos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/mag.webp',
                fit: BoxFit.cover,
              ),
              const partieTitre(),
              const partieTexte(),
              const partieIcone(),
              const partieRubrique(),
            ],
          ),
        ),
      ),
    );
  }
}

class partieTitre extends StatelessWidget {
  const partieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenue au Magazine Infos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Votre magazine numérique, votre source d\'inspiration',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class partieTexte extends StatelessWidget {
  const partieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        'Magazine Infos est bien plus qu\'un simple magazine d\'informations. '
        'C\'est votre passerelle vers le monde, une source inestimable de connaissances '
        'et d\'actualités soigneusement sélectionnées pour vous éclairer sur les enjeux mondiaux, '
        'la culture, la science, et voir même le divertissement (le jeux).',
      ),
    );
  }
}

class partieIcone extends StatelessWidget {
  const partieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _IconWithLabel(icon: Icons.phone, label: 'TEL'),
          _IconWithLabel(icon: Icons.email, label: 'MAIL'),
          _IconWithLabel(icon: Icons.share, label: 'PARTAGE'),
        ],
      ),
    );
  }
}

class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconWithLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.pink),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.pink)),
      ],
    );
  }
}

class partieRubrique extends StatelessWidget {
  const partieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/hands.jpg',
              width: 170,
            ),
          ),
          const SizedBox(width: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/papers.jpg',
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
