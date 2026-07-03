import 'package:flutter/material.dart';
import 'package:redacteur/views/home.dart';
import 'package:redacteur/models/redacteur.dart';
import 'package:redacteur/services/database_manager.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RedacteurInterfaceUtilisateur(),
    );
  }
}
