import 'package:commons/errors/exceptions.dart';
import 'package:guidestock/data/repositories/quotes_repository.dart';
import 'package:guidestock/domain/usecases/quotes_usecase.dart';

import '../entities/graph_entity.dart';
import '../entities/quote_entity.dart';

class QuotesUsecaseImpl extends QuotesUsecase {
  final QuotesRepository quotesRepository;

  QuotesUsecaseImpl({
    required this.quotesRepository,
  });

  @override
  Future<List<QuoteEntity>> getDataQuotes({
    required String code,
    required int period,
  }) async {
    try {
      final quotes =
          await quotesRepository.getDataQuotes(code: code, period: period);

      return quotes;
    } on UnableToGetQuote {
      rethrow;
    } catch (_) {
      throw UnableToGetQuote(
        'API Retornou erro UnableToGetQuote - usecase quotes',
      );
    }
  }

  @override
  List<GraphEntity> getDataGraph() {
    try {
      final graph = quotesRepository.getDataGraph();

      return graph;
    } on UnableToGetQuote {
      rethrow;
    } catch (_) {
      throw UnableToGetQuote(
        'API Retornou erro UnableToGetQuote - usecase graph',
      );
    }
  }
}
