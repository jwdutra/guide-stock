import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/entities/graph_entity.dart';

class ChartPage extends StatefulWidget {
  final Object? graphs;

  const ChartPage({
    Key? key,
    this.graphs,
  }) : super(key: key);

  @override
  ChartPageState createState() => ChartPageState();
}

class ChartPageState extends State<ChartPage> {
  late List<GraphEntity> quotesList;

  @override
  void initState() {
    quotesList = widget.graphs as List<GraphEntity>;
    inspect(quotesList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
