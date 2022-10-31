import '../entities/graph_entity.dart';
import '../entities/quote_entity.dart';

abstract class QuotesUsecase {
  Future<List<QuoteEntity>> getDataQuotes({
    required String code,
    required int period,
  });

  List<GraphEntity> getDataGraph();
}
