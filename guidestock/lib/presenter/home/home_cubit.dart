import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:commons/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/graph_entity.dart';
import '../../domain/entities/quote_entity.dart';
import '../../domain/usecases/quotes_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<GetQuoteState> {
  HomeCubit({
    required this.usecase,
  }) : super(GetQuoteInitial()) {
    codeController.text = 'PETR4';
    periodController.text = '30';
  }

  final QuotesUsecase usecase;

  final codeController = TextEditingController();
  final periodController = TextEditingController();

  getQuotes() async {
    try {
      emit(GetQuoteLoading());

      final quotes = await usecase.getDataQuotes(
        code: codeController.text,
        period: int.parse(periodController.text),
      );

      final graph = usecase.getDataGraph();

      emit(GetQuoteSuccess(quotes));
      emit(GetGraphSuccess(graph));
      //}
    } on StateError {
      emit(
        GetQuoteFailure(
          UnableToGetQuote('API Retornou erro - State error'),
        ),
      );
    } catch (e) {
      inspect(e);
      emit(GetQuoteFailure(UnableToGetQuote('API Retornou erro')));
    }
  }
}
