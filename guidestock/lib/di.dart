import 'package:commons/infrastructure/dio_backend/dio_backend_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:guidestock/data/repositories/quotes_repository.dart';
import 'package:guidestock/domain/repositories/quotes_repository_impl.dart';

import 'data/datasources/quote_provider.dart';
import 'data/datasources/quote_provider_impl.dart';
import 'domain/usecases/quotes_usecase.dart';
import 'domain/usecases/quotes_usecase_impl.dart';
import 'presenter/home/home_cubit.dart';

final di = GetIt.instance;
final dio = Dio();

Future<void> init() async {
  di.registerLazySingleton<DioBackendProvider>(
    () => DioBackendProvider(),
  );

  di.registerLazySingleton<QuoteProvider>(
    () => QuoteProviderImpl(
      request: di.get<DioBackendProvider>(),
    ),
  );

  di.registerLazySingleton<QuotesRepository>(
    () => QuotesRepositoryImpl(
      quoteProvider: di.get<QuoteProvider>(),
    ),
  );

  di.registerLazySingleton<QuotesUsecase>(
    () => QuotesUsecaseImpl(
      quotesRepository: di.get<QuotesRepository>(),
    ),
  );

  di.registerFactory<HomeCubit>(
    () => HomeCubit(
      usecase: di.get<QuotesUsecase>(),
    ),
  );
}
