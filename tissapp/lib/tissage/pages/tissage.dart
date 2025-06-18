import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/gridcontrol.dart';
import '../widgets/patterngrid.dart';
import '../providers/tissage.dart';

class TissagePage extends StatefulWidget {
  const TissagePage({super.key});

  @override
  State<TissagePage> createState() => _TissagePageState();
}

class _TissagePageState extends State<TissagePage> {
  @override
  Widget build(BuildContext context) {
    final tissage = Provider.of<TissageProvider>(context);

    return LayoutBuilder(builder: (context, constraints) {
      final maxX = tissage.threadsGrid.length + tissage.pedalsGrid.length;
      final maxY = tissage.sequenceGrid[0].length + tissage.pedalsGrid.length;
      final cellSize = min(
        constraints.maxWidth / maxX,
        constraints.maxHeight / maxY,
      );
      print(
          "maxX: $maxX, maxY: $maxY, cellSize: $cellSize, constraints: $constraints");

      return Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Placeholder for the pattern grid
                Expanded(
                    flex: tissage.pedalsGrid.length,
                    child: GridControlWidget(
                      gridData: tissage.pedalsGrid,
                      cellSize: cellSize,
                      onCellTap: (x, y) {
                        tissage.togglePedal(x, y);
                      },
                    )),
                // Placeholder for the threads grid
                Expanded(
                  flex: tissage.threadsGrid.length,
                  child: GridControlWidget(
                    gridData: tissage.threadsGrid,
                    cellSize: cellSize,
                    onCellTap: (x, y) {
                      tissage.toggleThread(x, y);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  // Placeholder for the pedals grid
                  Expanded(
                      flex: tissage.pedalsGrid.length,
                      child: GridControlWidget(
                        gridData: tissage.sequenceGrid,
                        cellSize: cellSize,
                        onCellTap: (x, y) {
                          tissage.toggleSequence(x, y);
                        },
                      )),
                  Expanded(
                    flex: tissage.threadsGrid.length,
                    child: PatternGridWidget(
                      cellSize: cellSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
