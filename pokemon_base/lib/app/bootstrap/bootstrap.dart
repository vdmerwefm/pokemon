import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_core/pokemon_core.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final baseUrl = appConfigSl<AppConfig>().pokeBaseUrl;
  if (baseUrl.isNotEmpty) {
    debugPrint('base url loaded successfully: $baseUrl');
  } else {
    debugPrint(
      'base url is empty, reverting to default: https://pokeapi.co/api/v2',
    );
    debugPrint(
      'base url is empty, please check your poke_config.json file',
    );
  }

  runApp(await builder());
}
