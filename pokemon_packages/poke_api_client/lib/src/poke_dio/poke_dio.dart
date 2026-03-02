import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
///
Dio pokeDio() {
  try {
    final options = BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    final basePokeDio = Dio(options);
    return basePokeDio;
  } on DioException catch (exception) {
    FlutterErrorDetails(exception: exception);
    return Dio();
  }
}
