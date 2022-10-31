import '../models/quote_model.dart';

abstract class QuoteProvider {
  Future<QuoteModel> getQuotesApi({
    required String code,
    required int period,
  });
}
