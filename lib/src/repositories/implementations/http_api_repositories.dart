import 'dart:convert';
import 'dart:developer';

import 'package:consumo_api/src/model/post_model.dart';
import 'package:consumo_api/src/repositories/api_repository.dart';
import 'package:consumo_api/src/repositories/errors/api_exception.dart';
import 'package:http/http.dart';

class HttpApiRepository implements ApiRepository {
  final Client _client;

  HttpApiRepository({required Client client}) : _client = client;

  @override
  Future<PostModel?> getPost(int postId) async {
    try {
      final url = '$API_URL/posts/$postId';

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return PostModel.fromJson(response.body);
      } else {
        throw ApiException(message: "Erro ao carregar post");
      }
    } catch (error, stacktrace) {
      log("Erro ao fazer get de post:", error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao carregar post");
    }
  }
}
