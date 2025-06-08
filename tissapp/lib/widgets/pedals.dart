import 'package:flutter/material.dart';

class PedalsWidget extends StatelessWidget {
  const PedalsWidget({
    required this.pedalsGrid,
    super.key});

  final List<List<bool>> pedalsGrid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
      ),
      itemCount: pedalsGrid.length * pedalsGrid[0].length,
      itemBuilder: (context, index) {
        final row = index ~/ pedalsGrid[0].length;
        final col = index % pedalsGrid[0].length;
        return GestureDetector(
          onTap: () {
            // Handle pedal tap
          },
          child: Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: pedalsGrid[row][col] ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }
}