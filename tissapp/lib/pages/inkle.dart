import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tissapp/widgets/pattern.dart';

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
        ],
      ),
      body: Column(
        children: [
          Center(
              child: PatternWidget(
                  // motif: motif.motif,
                  )),
          Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: 888,
                itemBuilder: (context, index) {
                  return PatternWidget();
                }),
          ),
        ],
      ),
    );
  }
}
