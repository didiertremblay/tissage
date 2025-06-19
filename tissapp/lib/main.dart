import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tissapp/pages/main.dart';
import 'package:tissapp/tissage/providers/tissage.dart';

import 'firebase_options.dart';
import 'inkle/providers/motif.dart';
import 'pages/mainauth.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        // Nous attendons l'initialisation
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        // Houston!!?
        if (snapshot.hasError) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const Center(child: Text("PROBLEME!!!")),
          );
        }

        // L'application peut démarrer
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // Si le stream a des données, nous avons une session
              if (snapshot.hasData) {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                        create: (context) => MotifProvider()),
                    ChangeNotifierProvider(
                        create: (context) => TissageProvider()),
                  ],
                  child: const MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: MainPage(),
                  ),
                );
              }

              // Sinon pas de session valide
              return AuthentificationGate();
            },
          ),
        );
      },
    );
  }
}

class MainAppO extends StatelessWidget {
  const MainAppO({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MotifProvider()),
        ChangeNotifierProvider(create: (context) => TissageProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
