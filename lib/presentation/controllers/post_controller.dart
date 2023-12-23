import 'package:consumo_api/src/model/post_model.dart';
import 'package:consumo_api/src/repositories/api_repository.dart';
import 'package:consumo_api/src/repositories/errors/api_exception.dart';

class PostController {
  final ApiRepository apiRepository;

  PostController(this.apiRepository);

// Caso de algum erro ao carregar o post, mostrar feedback para o usuário
  String? _errorLoadingPost;

  //Get do error Loading post
  String? get getErrorLoadingPost => _errorLoadingPost;

  // Mostrar o circular progress indicator enquanto o post estiver sendo carregado
  bool isLoading = true;

  //Post que será carregado
  PostModel? _loadedPost;

  PostModel? get getLoadedPost => _loadedPost;

  Future<void> onLoadPost(int postId) async {
    _errorLoadingPost = null;
    isLoading = true;
    try {
      final post = await apiRepository.getPost(postId);

      _loadedPost = post;
    } on ApiException catch (apiException) {
      _errorLoadingPost = apiException.message;
    } catch (error) {
      _errorLoadingPost = "Erro ao carregar post";
    }
    isLoading = false;
  }
}
