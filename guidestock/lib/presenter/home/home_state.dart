part of 'home_cubit.dart';

abstract class GetQuoteState extends Equatable {
  get quotes => null;
  get graph => null;
}

class GetQuoteInitial extends GetQuoteState {
  @override
  List<Object?> get props => [];
}

class GetQuoteLoading extends GetQuoteState {
  @override
  List<Object?> get props => [];
}

class GetQuoteSuccess extends GetQuoteState {
  @override
  final List<QuoteEntity> quotes;

  GetQuoteSuccess(this.quotes);

  @override
  List<Object?> get props => [quotes];
}

class GetGraphSuccess extends GetQuoteState {
  @override
  final List<GraphEntity> graph;

  GetGraphSuccess(this.graph);

  @override
  List<Object?> get props => [graph];
}

class GetQuoteFailure extends GetQuoteState {
  final UnableToGetQuote exception;

  GetQuoteFailure(this.exception);

  @override
  List<Object?> get props => [];
}
