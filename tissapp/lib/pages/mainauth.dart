import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthentificationGate extends StatefulWidget {
  AuthentificationGate({super.key});

  @override
  State<AuthentificationGate> createState() => _AuthentificationGateState();
}

class _AuthentificationGateState extends State<AuthentificationGate> {
  final auth = FirebaseAuth.instance;

  final nomUtilisateur = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nomUtilisateur.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Authentification"),
              TextField(
                controller: nomUtilisateur,
                decoration: const InputDecoration(
                  labelText: "Nom d'utilisateur",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (nomUtilisateur.text.isEmpty) {
                    return;
                  }

                  final authResult = await auth.signInAnonymously();

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(authResult.user!.uid)
                      .set({'username': nomUtilisateur.text});
                },
                child: const Text("Se connecter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
