import 'package:flutter/material.dart';
import 'package:tissapp/tissage/pages/tissage.dart';

import '../inkle/pages/inkle.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Page with bottom navigation bar and a placeholder for content
    return Scaffold(
      body: switch (_pageIndex) {
        0 => InklePage(),
        1 => TissagePage(),
        _ => const Center(child: Text('Unknown Page')),
      },
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.two_mp),
            label: 'Inkle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_4x4),
            label: 'Tissage',
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
