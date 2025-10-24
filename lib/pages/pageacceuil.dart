import 'package:activite1/Components/mydrawer.dart';
import 'package:flutter/material.dart';

class PageAcceuil extends StatelessWidget {
  const PageAcceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 245, 248),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Magazine Infos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade200,
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/mag.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                const partieTitre(),
                const partieTexte(),
                const partieIcone(),
                const partieRubrique(),
              ],
            ),
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
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenue au Magazine Infos',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            'Votre magazine numérique, votre source d\'inspiration',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.black,
            ),
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
      padding: EdgeInsets.all(12.0),
      child: Text(
        'Magazine Infos est bien plus qu\'un simple magazine d\'informations. '
        'C\'est votre passerelle vers le monde, une source inestimable de connaissances '
        'et d\'actualités soigneusement sélectionnées pour vous éclairer sur les enjeux mondiaux, '
        'la culture, la science, et voir même le divertissement (le jeux).',
        style: TextStyle(color: Colors.black),
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
        Icon(icon, color: Colors.pink.shade300),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.pink.shade300)),
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
