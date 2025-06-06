import 'package:flutter/material.dart';
import 'package:tissapp/providers/motif.dart';

// Display the trame of the pattern

class PatternWidget extends StatelessWidget {
  final Motif motif;
  const PatternWidget({required this.motif, super.key});

  List<Widget> _buildRow(
      List<Map<String, String>> row, int index, double size) {
    return [
      if (index % 2 == 1)
        Container(
          width: size / 2,
          height: size, //10,
          color: Colors.black,
          //child: Text("D"),
        ),
      ...row.map((e) {
        return Container(
          width: size,
          height: size, //10,
          color: Color(int.parse(
            "FF${(e['couleur'] as String).substring(1)}",
            radix: 16,
          )),
          child: Text("$index"),
        );
      }).toList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainte) {
      final size = constrainte.maxWidth / motif.motif[0].length;
      //final size = 10.0;
      return Column(
        children: [
          for (var r = 0; r < motif.motif.length; r++)
            Row(
              children: _buildRow(motif.motif[r], r, size),
              /*
                [
                  
                  for (var i=0; i < motif.motif[r].length; i++)
                    Container(
                      width: 20,
                      height: 20,
                      color: Color(int.parse(
                        "FF${(motif.motif[r][i]['couleur'] as String).substring(1)}",
                        radix: 16,
                      )),
                      //child: Text("D"),
                    ),
                ],
                */
            ),
        ],
      );
    });
  }
}
