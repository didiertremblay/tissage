import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:tissapp/providers/motif.dart';

// Display the trame of the pattern

class PatternWidget extends StatelessWidget {
  PatternWidget({super.key});

  late double size;

  List<Widget> _buildRow(List<Map<String, String>> row, int index, double size,
      MotifProvider motif, ctx) {
    return [
      if (index % 2 == 1)
        Container(
          width: size / 2,
          height: size, //10,
          color: Colors.black,
          //child: Text("D"),
        ),
      for (var i = 0; i < row.length; i++)
        GestureDetector(
          onSecondaryTap: () async {
            //motif.setColor(row[i]['id']!, Colors.white);
            // open a color picker dialog to select a color
            final newColor = await showDialog(
              context: ctx,
              builder: (context) {
                bool returned = false;
                Color selectedColor = Color(
                  int.parse(
                    "FF${(row[i]['couleur'] as String).substring(1)}",
                    radix: 16,
                  ),
                );
                return AlertDialog(
                  title: Text("Select Color"),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: Color(
                        int.parse(
                          "FF${(row[i]['couleur'] as String).substring(1)}",
                          radix: 16,
                        ),
                      ),
                      onColorChanged: (color) {
                        selectedColor = color;
                      },
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        //setState(() => currentColor = pickerColor);
                        Navigator.of(context).pop(selectedColor);
                      },
                    ),
                  ],
                );
              },
            );
            if (newColor != null) {
              motif.changeMotif(i, index % 2, newColor);
            }
          },
          child: DragTarget<Color>(
            onAcceptWithDetails: (DragTargetDetails<Color> details) {
              //motif.setColor(row[i]['id']!, details.data);
              motif.changeMotif(i, index % 2, details.data);
            },
            onWillAcceptWithDetails: (details) {
              return true;
            },
            builder: (context, candidateData, rejectedData) {
              return DragColor(
                size: size,
                couleur: Color(
                  int.parse(
                    "FF${(row[i]['couleur'] as String).substring(1)}",
                    radix: 16,
                  ),
                ),
              );
            },
          ),
        ),

      /*
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
      */
    ];
  }

  @override
  Widget build(BuildContext context) {
    final motif = Provider.of<MotifProvider>(context);

    return LayoutBuilder(builder: (context, constrainte) {
      size = constrainte.maxWidth / motif.motif.motif[0].length;
      //final size = 10.0;
      return Column(
        children: [
          for (var r = 0; r < motif.motif.motif.length; r++)
            Row(
              children:
                  _buildRow(motif.motif.motif[r], r, size, motif, context),
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

class DragColor extends StatelessWidget {
  const DragColor({
    super.key,
    required this.size,
    required this.couleur,
  });

  final double size;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Draggable<Color>(
      data: couleur,
      feedback: Icon(Icons.format_paint, color: couleur),
      child: Container(
        width: size,
        height: size, //10,
        color: couleur,
        //child: Text("$index, $i"),
      ),
    );
  }
}
