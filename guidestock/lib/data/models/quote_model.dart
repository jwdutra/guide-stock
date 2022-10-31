// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuoteModel extends Equatable {
  final List<double>? high;
  final List<double>? close;
  final List<double>? open;
  final List<double>? low;
  final List<int>? volume;
  final List<int>? date;

  const QuoteModel({
    this.high,
    this.close,
    this.open,
    this.low,
    this.volume,
    this.date,
  });

  factory QuoteModel.fromMap(Map<String, dynamic> data) => QuoteModel(
        high: data['high'] as List<double>?,
        close: data['close'] as List<double>?,
        open: data['open'] as List<double>?,
        low: data['low'] as List<double>?,
        volume: data['volume'] as List<int>?,
        date: data['date'] as List<int>?,
      );

  Map<String, dynamic> toMap() => {
        'high': high,
        'close': close,
        'open': open,
        'low': low,
        'volume': volume,
        'date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QuoteModel].
  factory QuoteModel.fromJson(String data) {
    return QuoteModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QuoteModel] to a JSON string.
  String toJson() => json.encode(toMap());

  QuoteModel copyWith({
    List<double>? high,
    List<double>? close,
    List<double>? open,
    List<double>? low,
    List<int>? volume,
    List<int>? date,
  }) {
    return QuoteModel(
      high: high ?? this.high,
      close: close ?? this.close,
      open: open ?? this.open,
      low: low ?? this.low,
      volume: volume ?? this.volume,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        high,
        close,
        open,
        low,
        volume,
        date,
      ];
}
