import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../providers/motif.dart';
import '../widgets/inkpattern.dart';
import '../widgets/printPattern.dart';

// From : https://pub.dev/packages/printing/example

class PrintPage extends StatelessWidget {
  const PrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final motif = Provider.of<MotifProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aperçu avant impression'),
      ),
      body: PdfPreview(build: (format) {
        //return _generatePdfOrigine(format, context.toString());
        return _generatePdf(format, context, motif);
      }),
    );
  }

  Future<Uint8List> _generatePdf(
    PdfPageFormat format,
    BuildContext context,
    MotifProvider motif,
  ) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Text(motif.config.commentaires),
                pw.Center(
                    child: PrintPattern(
                  motif: motif.motif,
                )),
                pw.Divider(),
                pw.Expanded(
                  child: pw.ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return PrintPattern(
                          motif: motif.motif,
                        );
                        ;
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  Future<Uint8List> _generatePdfOrigine(
      PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
