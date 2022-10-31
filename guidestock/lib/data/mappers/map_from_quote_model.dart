import 'package:intl/intl.dart';

import '../../domain/entities/graph_entity.dart';
import '../../domain/entities/quote_entity.dart';
import '../models/quote_model.dart';

final f = NumberFormat("###.0#", "en_US");

extension MapFromQuoteModel on QuoteModel {
  List<QuoteEntity> toQuoteEntity() {
    final listQuotes = <QuoteEntity>[];
    var acumulado = 0.0;
    var acumuladoPorcento = 0.0;

    date!.asMap().forEach((key, value) {
      QuoteEntity quoteEntity = const QuoteEntity();

      if (volume![key] > 0) {
        int k = key - 1;
        var variacao = key > 0 ? close![key] - close![k] : 0;
        var porcentoDiario = (variacao * 100) / open![key];
        acumulado = acumulado + variacao;
        acumuladoPorcento = acumuladoPorcento + porcentoDiario;

        final quote = quoteEntity.copyWith(
          data: value,
          abertura: double.parse(f.format(open![key])),
          fechamento: double.parse(f.format(close![key])),
          variacaoDiaria: double.parse(f.format(variacao)),
          acumulado: double.parse(f.format(acumulado)),
          porcentoDiario: double.parse(f.format(porcentoDiario)),
          porcentoTotal: double.parse(f.format(acumuladoPorcento)),
        );

        listQuotes.add(quote);
      }
    });

    return listQuotes;
  }

  List<GraphEntity> toGraphEntity() {
    final listGraph = <GraphEntity>[];
    var acumulado = 0.0;

    date!.asMap().forEach((key, value) {
      GraphEntity graphEntity = const GraphEntity();
      acumulado = acumulado + volume![key];

      final graph = graphEntity.copyWith(
        open: double.parse(f.format(open![key])),
        high: double.parse(f.format(high![key])),
        low: double.parse(f.format(low![key])),
        close: double.parse(f.format(close![key])),
        vol: volume![key],
        amount: acumulado,
        time: date![key],
        change: null,
        ratio: null,
      );

      listGraph.add(graph);
    });

    return listGraph;
  }
}
