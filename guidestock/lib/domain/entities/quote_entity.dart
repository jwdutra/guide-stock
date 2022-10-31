// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final int? data;
  final double? abertura;
  final double? fechamento;
  final double? variacaoDiaria;
  final double? acumulado;
  final double? porcentoDiario;
  final double? porcentoTotal;

  const QuoteEntity({
    this.data,
    this.abertura,
    this.fechamento,
    this.variacaoDiaria,
    this.acumulado,
    this.porcentoDiario,
    this.porcentoTotal,
  });

  QuoteEntity copyWith({
    int? data,
    double? abertura,
    double? fechamento,
    double? variacaoDiaria,
    double? acumulado,
    double? porcentoDiario,
    double? porcentoTotal,
  }) {
    return QuoteEntity(
      data: data ?? this.data,
      abertura: abertura ?? this.abertura,
      fechamento: fechamento ?? this.fechamento,
      variacaoDiaria: variacaoDiaria ?? this.variacaoDiaria,
      acumulado: acumulado ?? acumulado,
      porcentoDiario: porcentoDiario ?? this.porcentoDiario,
      porcentoTotal: porcentoTotal ?? this.porcentoTotal,
    );
  }

  @override
  List<Object?> get props {
    return [
      data,
      abertura,
      fechamento,
      variacaoDiaria,
      acumulado,
      porcentoDiario,
      porcentoTotal,
    ];
  }
}
