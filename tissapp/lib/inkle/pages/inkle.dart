import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/inkpattern.dart';
import '../providers/motif.dart';
import 'printPage.dart';

class InklePage extends StatelessWidget {
  const InklePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final motif = Provider.of<MotifProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(motif.config.name),
            Spacer(),
            Text(motif.config.commentaires),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrintPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              motif.save();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              motif.load();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: InklePatternWidget(
                  // motif: motif.motif,
                  )),
          Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: 888,
                itemBuilder: (context, index) {
                  return InklePatternWidget();
                }),
          ),
        ],
      ),
    );
  }
}
