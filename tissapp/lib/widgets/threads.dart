import 'package:flutter/material.dart';

class ThreadsWidget extends StatelessWidget {
  const ThreadsWidget({required this.threadGrid, super.key});

  final List<List<bool>> threadGrid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: threadGrid.length,
        childAspectRatio: 1.0,
      ),
      itemCount: threadGrid.length * threadGrid[0].length,
      itemBuilder: (context, index) {
        final row = index ~/ threadGrid[0].length;
        final col = index % threadGrid[0].length;
        return GestureDetector(
          onTap: () {
            // Handle pedal tap
          },
          child: Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: threadGrid[row][col] ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }
}
