import 'package:Lembretes_Flutterama/db/database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text("Inicio")),
      body: Column(
        children: [Text('Ola ${Database().usuarioLogado?.nome ?? ""} ')],
      ),
    );
  }
}
