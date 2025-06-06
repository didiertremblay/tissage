import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';
import 'providers/motif.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MotifProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeApp(),
      ),
    );
  }
}
