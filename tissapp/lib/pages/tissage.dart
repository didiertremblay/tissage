import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tissapp/widgets/gridcontrol.dart';
import 'package:tissapp/widgets/patterngrid.dart';
import 'package:tissapp/widgets/pedals.dart';
import 'package:tissapp/widgets/threads.dart';

import '../providers/tissage.dart';
import '../widgets/pattern.dart';

class TissagePage extends StatefulWidget {
  const TissagePage({super.key});

  @override
  State<TissagePage> createState() => _TissagePageState();
}

class _TissagePageState extends State<TissagePage> {
  @override
  Widget build(BuildContext context) {
    final tissage = Provider.of<TissageProvider>(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              // Placeholder for the pattern grid
              Expanded(
                  child: GridControlWidget(
                gridData: tissage.pedalsGrid,
                onCellTap: (x, y) {
                  tissage.togglePedal(x, y);
                },
              )),
              // Placeholder for the pedals grid
              Expanded(
                  flex: 5,
                  child: GridControlWidget(
                    gridData: tissage.sequenceGrid,
                    onCellTap: (x, y) {
                      tissage.toggleSequence(x, y);
                    },
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              // Placeholder for the threads grid
              Expanded(
                child: GridControlWidget(
                  gridData: tissage.threadsGrid,
                  onCellTap: (x, y) {
                    tissage.toggleThread(x, y);
                  },
                ),
              ),
              Expanded(
                flex: 5,
                child: PatternGridWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
