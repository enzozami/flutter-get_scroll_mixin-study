import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_scroll_mixin/models/user_model.dart';

class UserRepository {
  final Dio _dio;

  UserRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<List<UserModel>> getUsers(int page, int limit) async {
    try {
      debugPrint('Buscando Pagina $page');
      final result = await _dio.get('/users', queryParameters: {
        'page': page,
        'limit': limit,
      });

      return result.data.map<UserModel>((user) => UserModel.fromMap(user)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar Usuarios', error: e, stackTrace: s);
      throw Exception();
    }
  }
}
