import 'package:flutter/material.dart';

import 'package:commons/infrastructure/config/app_globals.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/graph_entity.dart';
import '../../domain/entities/quote_entity.dart';

import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final formState = GlobalKey<FormState>();

  late HomeCubit homeCubit;
  var quotes = <QuoteEntity>[];
  var graphs = <GraphEntity>[];

  @override
  void initState() {
    homeCubit = di.get<HomeCubit>();
    super.initState();
    Future.delayed(Duration.zero, () async {
      await homeCubit.getQuotes();
    });
  }

  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: const Text('Guide Stock'),
      ),
      body: BlocProvider<HomeCubit>(
        create: (_) => homeCubit,
        child: BlocListener<HomeCubit, GetQuoteState>(
          listener: (_, state) {
            switch (state.runtimeType) {
              case GetQuoteLoading:
                const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case GetQuoteSuccess:
                quotes = state.quotes;
                _snack(context, 'Cotações retornadascom sucesso');
                break;
              case GetGraphSuccess:
                graphs = state.graph;
                break;
              case GetQuoteFailure:
                _snack(context, 'Erro ao buscar cotações', type: 'error');
                break;
              default:
                GetQuoteLoading;
            }
          },
          child: _page(context),
        ),
      ),
    );
  }

  Widget _page(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _fieldCode(),
                    const SizedBox(height: 20.0),
                    _fieldPeriod(),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          _sendButton(context),
                          const SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _tableButton(context),
                              _graphButton(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _fieldCode() {
    return TextFormField(
      maxLength: 5,
      autovalidateMode: AutovalidateMode.always,
      controller: homeCubit.codeController,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Código da empresa',
        filled: true,
        isDense: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'O código é obrigatório';
        if (value.length < 5) return 'Código inválido';

        return null;
      },
    );
  }

  TextFormField _fieldPeriod() {
    return TextFormField(
      maxLength: 3,
      controller: homeCubit.periodController,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        labelText: 'Período em dias',
        filled: true,
        isDense: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty || int.parse(value) < 2) {
          return 'Período é obrigatório e maior que 2';
        }

        return null;
      },
    );
  }

  ElevatedButton _sendButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0.0),
      ),
      onPressed: () async {
        if (formState.currentState!.validate()) {
          _snack(context, 'Buscando cotações...');

          await homeCubit.getQuotes();

          _closeSnack(context);
        }
      },
      child: const Text('Buscar cotações'),
    );
  }

  ElevatedButton _tableButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0.0),
      ),
      onPressed: () {
        context.push('/table', extra: quotes);
      },
      child: const Text('Mostrar tabela'),
    );
  }

  ElevatedButton _graphButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0.0),
      ),
      onPressed: () {
        context.push('/graph', extra: graphs);
      },
      child: const Text('Mostrar gráfico'),
    );
  }

  _snack(BuildContext context, String message, {String type = 'success'}) {
    var typeColor = (type == 'error') ? Colors.red : Colors.green[900];

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: (typeColor),
      ),
    );
  }

  _closeSnack(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
