import 'dart:developer';

import 'package:commons/errors/exceptions.dart';
import 'package:guidestock/data/mappers/map_from_quote_model.dart';

import '../../data/datasources/quote_provider.dart';
import '../../data/models/quote_model.dart';
import '../../data/repositories/quotes_repository.dart';
import '../entities/graph_entity.dart';
import '../entities/quote_entity.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  final QuoteProvider quoteProvider;

  late QuoteModel quotes;

  QuotesRepositoryImpl({
    required this.quoteProvider,
  });

  @override
  Future<List<QuoteEntity>> getDataQuotes({
    required String code,
    required int period,
  }) async {
    try {
      quotes = await quoteProvider.getQuotesApi(code: code, period: period);

      inspect(quotes);

      final results = quotes.toQuoteEntity();

      return results;
    } on UnableToGetQuote {
      rethrow;
    } catch (_) {
      throw UnableToGetQuote(
        'API Retornou erro UnableToGetQuote - repository quotes',
      );
    }
  }

  @override
  List<GraphEntity> getDataGraph() {
    try {
      final results = quotes.toGraphEntity();

      return results;
    } on UnableToGetQuote {
      rethrow;
    } catch (_) {
      throw UnableToGetQuote(
        'API Retornou erro UnableToGetQuote - repository graph',
      );
    }
  }
}
