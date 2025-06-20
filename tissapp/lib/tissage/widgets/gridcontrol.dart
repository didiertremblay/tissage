import 'dart:math';

import 'package:flutter/material.dart';

class GridControlWidget extends StatelessWidget {
  const GridControlWidget({
    this.gridData = const [],
    required this.onCellTap,
    required this.cellSize,
    super.key,
  });

  final List<List<bool>> gridData;
  final double cellSize;
  final Function(int x, int y) onCellTap;

  @override
  Widget build(BuildContext context) {
    final int maxX = gridData.length;
    final int maxY = gridData.isNotEmpty ? gridData[0].length : 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var x = 0; x < maxX; x++)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var y = 0; y < maxY; y++)
                GestureDetector(
                  onTap: () {
                    // Handle tap on the grid cell
                    onCellTap(x, y);
                    //print('Tapped on cell ($x, $y)');
                  },
                  child: Container(
                    width: cellSize,
                    height: cellSize,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: gridData[x][y] ? Colors.green : Colors.lightGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
