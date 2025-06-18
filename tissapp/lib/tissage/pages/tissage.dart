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
        constraints.maxWidth / (maxX + 6),
        constraints.maxHeight / (maxY + 1),
      );

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.indigo[100],
                border: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 4.0),
                ),
              ),
              child: Row(
                children: [
                  // Placeholder for the pattern grid
                  Expanded(
                      flex: tissage.pedalsGrid.length,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber[200],
                          border: const Border(
                            right: BorderSide(color: Colors.grey, width: 4.0),
                          ),
                        ),
                        child: Center(
                          child: GridControlWidget(
                            gridData: tissage.pedalsGrid,
                            cellSize: cellSize,
                            onCellTap: (x, y) {
                              tissage.togglePedal(x, y);
                            },
                          ),
                        ),
                      )),
                  // Placeholder for the threads grid
                  /*
                  Container(
                    color: Colors.black,
                    width: cellSize * 0.2,
                  ),
                  */
                  Expanded(
                    flex: tissage.threadsGrid.length,
                    child: Center(
                      child: GridControlWidget(
                        gridData: tissage.threadsGrid,
                        cellSize: cellSize,
                        onCellTap: (x, y) {
                          tissage.toggleThread(x, y);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*
          Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
          */
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  // Placeholder for the pedals grid
                  Expanded(
                    flex: tissage.pedalsGrid.length,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        border: const Border(
                          right: BorderSide(color: Colors.grey, width: 4.0),
                        ),
                      ),
                      child: Center(
                        child: GridControlWidget(
                          gridData: tissage.sequenceGrid,
                          cellSize: cellSize,
                          onCellTap: (x, y) {
                            tissage.toggleSequence(x, y);
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: tissage.threadsGrid.length,
                    child: Center(
                      child: PatternGridWidget(
                        cellSize: cellSize,
                      ),
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
