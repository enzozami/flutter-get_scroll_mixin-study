import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_scroll_mixin/models/user_model.dart';

class UserRepository {
  final Dio _dio;

  UserRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<List<UserModel>> getUser() async {
    try {
      final result = await _dio.get('/users');

      return result.data.map((user) => UserModel.fromMap(user)).toList();
    } on DioException catch (e) {
      log('Erro ao buscar Usuarios', error: e);
      throw Exception();
    }
  }
}
