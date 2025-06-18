import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tissapp/pages/main.dart';
import 'package:tissapp/tissage/providers/tissage.dart';

import 'inkle/pages/inkle.dart';
import 'inkle/providers/motif.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
