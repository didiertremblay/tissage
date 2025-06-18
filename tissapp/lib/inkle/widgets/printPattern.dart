import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:tissapp/inkle/providers/motif.dart';

// Display the trame of the pattern

class PrintPattern extends StatelessWidget {
  final Motif motif;
  PrintPattern({required this.motif});

  List<Widget> _buildRow(
      List<Map<String, String>> row, int index, double size) {
    return [
      if (index % 2 == 1)
        Container(
          width: size / 2,
          height: size, // 10,
          color: PdfColors.red,
        ),
      ...row.map((e) {
        return Container(
          width: size,
          height: size, // 10,
          color: PdfColor.fromInt(int.parse(
            "FF${(e['couleur'] as String).substring(1)}",
            radix: 16,
          )),
        );
      }).toList(),
    ];
  }

  @override
  Widget build(context) {
    return LayoutBuilder(builder: (context, constrainte) {
      final size = constrainte!.maxWidth / motif.motif[0].length;
      //final size = 10.0;
      return Column(
        children: [
          for (var r = 0; r < motif.motif.length; r++)
            Row(
              children: _buildRow(motif.motif[r], r, size),
            ),
        ],
      );
    });
  }
}
