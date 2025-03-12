import 'package:pay4me/features/home/data/model/response/post_response_model.dart';

abstract interface class HomeRepositoryInterface {
  Future<List<PostResponseModel>> getPosts();
}