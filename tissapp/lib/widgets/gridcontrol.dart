import 'package:flutter/material.dart';

class GridControlWidget extends StatelessWidget {
  const GridControlWidget({
    this.gridData = const [],
    required this.onCellTap,
    super.key,
  });

  final List<List<bool>> gridData;
  final Function(int x, int y) onCellTap;

  @override
  Widget build(BuildContext context) {
    final int maxX = gridData.length;
    final int maxY = gridData.isNotEmpty ? gridData[0].length : 0;

    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          for (var x = 0; x < maxX; x++)
            Column(
              children: [
                for (var y = 0; y < maxY; y++)
                  GestureDetector(
                    onTap: () {
                      // Handle tap on the grid cell
                      onCellTap(x, y);
                      print('Tapped on cell ($x, $y)');
                    },
                    child: Container(
                      width: constraints.maxWidth / (maxX + 2),
                      height: constraints.maxHeight / (maxY + 2),
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color:
                            gridData[x][y] ? Colors.green : Colors.lightGreen,
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
