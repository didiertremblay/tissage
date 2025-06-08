import 'package:flutter/material.dart';

class TissageProvider with ChangeNotifier {
  // Add properties and methods to manage the tissage state
  // For example, you might want to manage a list of threads, colors, etc.

  final List<List<bool>> _pedalsGrid =
      List.generate(4, (index) => List.filled(4, false));
  final List<List<bool>> _threadsGrid =
      List.generate(20, (index) => List.filled(4, false));
  final List<List<bool>> _sequenceGrid =
      List.generate(4, (index) => List.filled(30, false));
}

class TissagePage extends StatefulWidget {
  const TissagePage({super.key});

  @override
  State<TissagePage> createState() => _TissagePageState();
}

class _TissagePageState extends State<TissagePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              // Placeholder for the pattern grid
              Expanded(
                child: Container(
                    color: Colors.grey[200],
                    child: const Center(child: Text('Pattern Grid'))),
              ),
              // Placeholder for the pedals grid
              Expanded(
                flex: 5,
                child: Container(
                    color: Colors.green[300],
                    child: const Center(child: Text('Pedals Grid'))),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              // Placeholder for the threads grid
              Expanded(
                child: Container(
                  color: Colors.blue[400],
                  child: const Center(child: Text('Sequence Grid')),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.red[300],
                  child: const Center(child: Text('Pattern Grid')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
