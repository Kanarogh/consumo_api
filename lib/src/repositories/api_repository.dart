import 'package:consumo_api/src/model/post_model.dart';

const String API_URL = 'https://jsonplaceholder.typicode.com';

abstract class ApiRepository {
  Future<PostModel?> getPost(int postId);
}
