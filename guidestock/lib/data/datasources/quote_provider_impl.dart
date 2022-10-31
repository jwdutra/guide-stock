import 'dart:convert';
import 'dart:developer';

import 'package:commons/errors/exceptions.dart';
import 'package:commons/infrastructure/dio_backend/dio_backend_provider.dart';

import '../models/quote_model.dart';

import 'quote_provider.dart';

class QuoteProviderImpl extends QuoteProvider {
  final DioBackendProvider? request;

  QuoteProviderImpl({
    this.request,
  });

  @override
  Future<QuoteModel> getQuotesApi({
    required String code,
    required int period,
  }) async {
    try {
      final DateTime now = DateTime.now();
      String end = now.millisecondsSinceEpoch.toString().substring(0, 10);
      String init = now
          .subtract(Duration(days: period * 2))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 10);

      var path = '$code.SA?period1=$init&period2=$end&interval=1d';
      var response = await request!.get(path: path);

      var responseQuotes = jsonDecode(response);

      var dates = responseQuotes['chart']['result'][0]['timestamp'];

      var quotes =
          responseQuotes['chart']['result'][0]['indicators']['quote'][0];

      var open = <double>[];
      var close = <double>[];
      var high = <double>[];
      var low = <double>[];
      var volume = <int>[];
      var date = <int>[];

      quotes.forEach((key, value) {
        if (key == 'high') {
          value.asMap().forEach((k, e) => high.add(e));
        }
        if (key == 'close') {
          value.asMap().forEach((k, e) => close.add(e));
        }
        if (key == 'low') {
          value.asMap().forEach((k, e) => low.add(e));
        }
        if (key == 'open') {
          value.asMap().forEach((k, e) => open.add(e));
        }
        if (key == 'volume') {
          value.asMap().forEach((k, e) => volume.add(e));
        }
      });

      dates.asMap().forEach((key, value) => date.add(value));

      QuoteModel quoteModel = const QuoteModel();

      var inicio = date.length - period;
      var fim = date.length;

      quoteModel = quoteModel.copyWith(
        high: high.getRange(inicio, fim).toList(),
        close: close.getRange(inicio, fim).toList(),
        low: low.getRange(inicio, fim).toList(),
        open: open.getRange(inicio, fim).toList(),
        volume: volume.getRange(inicio, fim).toList(),
        date: date.getRange(inicio, fim).toList(),
      );

      return quoteModel;
    } catch (e) {
      inspect(e);
      throw UnableToGetQuote('Erro de request de quotes 1');
    }
  }
}
