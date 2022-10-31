import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../domain/entities/quote_entity.dart';

class TablePage extends StatelessWidget {
  final Object? quotes;
  const TablePage({
    this.quotes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    inspect(quotes);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotações'),
      ),
      body: _table(),
    );
  }

  Widget _table() {
    final quotesList = quotes as List<QuoteEntity>;
    var count = 1;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  _titulo('Dia', 40.0),
                  Expanded(child: _titulo('Data', 100.0)),
                  _titulo('Valor', 60.0),
                  _titulo('Variação', 80.0),
                  _titulo('Acumulado', 90.0),
                ],
              ),
              for (final e in quotesList)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _valor((count++).toString(), 40.0),
                    Expanded(child: _valor(formatDate(e.data!), 100.0)),
                    _valor(e.fechamento.toString(), 60),
                    _valor('${e.porcentoDiario.toString()} %', 80.0),
                    _valor('${e.porcentoTotal.toString()} %', 90.0),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titulo(final String name, final double size) {
    return Container(
      width: size,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(name),
      ),
    );
  }

  Widget _valor(final String dado, final double size) {
    return Container(
      alignment: Alignment.centerRight,
      width: size,
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          dado,
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  String formatDate(final int timestamp) {
    final DateTime data = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var result = DateFormat('dd/MM/yyyy').format(data);

    return result;
  }
}
