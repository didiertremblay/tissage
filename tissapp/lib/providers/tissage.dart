import 'package:flutter/material.dart';

class TissageProvider with ChangeNotifier {
  // Add properties and methods to manage the tissage state
  // For example, you might want to manage a list of threads, colors, etc.

  final List<List<bool>> _pedalsGrid = [];
  final List<List<bool>> _threadsGrid = [];
  final List<List<bool>> _sequenceGrid = [];

  initialize({int pedals = 4, int threads = 25, int sequences = 25}) {
    _pedalsGrid.clear();
    _threadsGrid.clear();
    _sequenceGrid.clear();

    _pedalsGrid
        .addAll(List.generate(pedals, (index) => List.filled(pedals, false)));
    _threadsGrid
        .addAll(List.generate(threads, (index) => List.filled(pedals, false)));
    _sequenceGrid.addAll(
        List.generate(pedals, (index) => List.filled(sequences, false)));

    notifyListeners();
  }

  TissageProvider() {
    initialize();

    _pedalsGrid[0][0] = true; // Example initialization
    _pedalsGrid[1][1] = true; // Example initialization

    _threadsGrid[0][0] = true; // Example initialization
    _threadsGrid[1][1] = true; // Example initialization

    _sequenceGrid[0][0] = true; // Example initialization
    _sequenceGrid[1][1] = true; // Example initialization
  }

  get pedalsGrid => _pedalsGrid;
  get threadsGrid => _threadsGrid;
  get sequenceGrid => _sequenceGrid;

  void togglePedal(int row, int col) {
    _pedalsGrid[row][col] = !_pedalsGrid[row][col];
    notifyListeners();
  }

  void toggleThread(int row, int col) {
    _threadsGrid[row][col] = !_threadsGrid[row][col];
    notifyListeners();
  }

  void toggleSequence(int row, int col) {
    _sequenceGrid[row][col] = !_sequenceGrid[row][col];
    notifyListeners();
  }
}
