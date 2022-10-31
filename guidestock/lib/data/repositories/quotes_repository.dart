import '../../domain/entities/graph_entity.dart';
import '../../domain/entities/quote_entity.dart';

abstract class QuotesRepository {
  Future<List<QuoteEntity>> getDataQuotes({
    required String code,
    required int period,
  });

  List<GraphEntity> getDataGraph();
}
