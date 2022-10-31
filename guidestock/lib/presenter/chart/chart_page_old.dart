import 'dart:developer';

import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  final Object? graphs;
  const ChartPage({
    this.graphs,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    inspect(graphs);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico'),
      ),
      body: Container(),
    );
  }
}
