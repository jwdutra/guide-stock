import 'package:equatable/equatable.dart';

class GraphEntity extends Equatable {
  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final int? vol;
  final double? amount;
  final int? time;
  final double? change;
  final double? ratio;

  const GraphEntity({
    this.open,
    this.high,
    this.low,
    this.close,
    this.vol,
    this.amount,
    this.time,
    this.change,
    this.ratio,
  });

  GraphEntity copyWith({
    double? open,
    double? high,
    double? low,
    double? close,
    int? vol,
    double? amount,
    int? time,
    double? change,
    double? ratio,
  }) {
    return GraphEntity(
      open: open ?? this.open,
      high: high ?? this.high,
      low: low ?? this.low,
      close: close ?? this.close,
      vol: vol ?? this.vol,
      amount: amount ?? this.amount,
      time: time ?? this.time,
      change: change ?? this.change,
      ratio: ratio ?? this.ratio,
    );
  }

  @override
  List<Object?> get props {
    return [
      open,
      high,
      low,
      close,
      vol,
      amount,
      time,
      change,
      ratio,
    ];
  }
}
