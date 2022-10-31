import 'package:flutter/material.dart';

import 'package:candlesticks/candlesticks.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Candle> candles = [];

    for (final e in quotesList) {
      final candle = Candle(
        date: DateTime.fromMillisecondsSinceEpoch(e.time ?? 0 * 1000),
        open: e.open ?? 0.0,
        high: e.high ?? 0.0,
        low: e.low ?? 0.0,
        close: e.close ?? 0.0,
        volume: double.parse(e.vol.toString()),
      );

      candles.add(candle);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Candlesticks(
          candles: candles,
        ),
      ),
    );
  }
}
