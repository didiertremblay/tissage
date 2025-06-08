import 'package:flutter/material.dart';

class TissageProvider with ChangeNotifier {
  // Add properties and methods to manage the tissage state
  // For example, you might want to manage a list of threads, colors, etc.

  final List<List<bool>> _pedalsGrid =
      List.generate(4, (index) => List.filled(4, false));
  final List<List<bool>> _threadsGrid =
      List.generate(25, (index) => List.filled(4, false));
  final List<List<bool>> _sequenceGrid =
      List.generate(4, (index) => List.filled(25, false));

  TissageProvider() {
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
