import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tissage.dart';

class PatternGridWidget extends StatelessWidget {
  const PatternGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tissage = Provider.of<TissageProvider>(context);

    final maxX = tissage.threadsGrid.length;
    final maxY =
        tissage.sequenceGrid.isNotEmpty ? tissage.sequenceGrid[0].length : 0;

    bool isIntersecting(int x, int y) {
      //print('Checking intersection for ($x, $y)');

      final sequenceRow = [
        for (var i = 0; i < 4; i++) tissage.sequenceGrid[i][y] ? true : false
      ];
      //print('Sequence Row: $sequenceRow');

      final pedalRow = [
        for (var i = 0; i < 4; i++)
          [
            for (var j = 0; j < 4; j++)
              (sequenceRow[j])
                  ? (tissage.pedalsGrid[j][i])
                      ? true
                      : false
                  : false
          ].reduce((a, b) => a | b)
      ];
      print('Pedal Row: $pedalRow');

      return [
        for (var i = 0; i < 4; i++)
          (pedalRow[i]) ? tissage.threadsGrid[x][i] : false
      ].reduce((a, b) => a | b);
    }

    return LayoutBuilder(builder: (context, constraints) {
      final cellSize = min(
        constraints.maxWidth / (maxX + 2),
        constraints.maxHeight / (maxY + 2),
      );

      return Row(
        children: [
          for (var x = 0; x < maxX; x++)
            Column(
              children: [
                for (var y = 0; y < maxY; y++)
                  GestureDetector(
                    onTap: () {
                      // Handle tap on the grid cell
                      print('Tapped on cell ($x, $y)');
                    },
                    child: Container(
                      width: cellSize,
                      height: cellSize,
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: isIntersecting(x, y)
                            ? Colors.green
                            : Colors.lightGreen,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      );
    });
  }
}
