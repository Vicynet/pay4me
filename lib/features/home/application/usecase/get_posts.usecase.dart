import 'package:pay4me/core/apis/interceptors/error_parser.dart';
import 'package:pay4me/core/locator/service_locator.dart';
import 'package:pay4me/core/utils/extensions/extension_fun.dart';
import 'package:pay4me/core/utils/type_definitions.dart';
import 'package:pay4me/features/home/data/model/response/post_response_model.dart';
import 'package:pay4me/features/home/data/repository_interface/home_repository.interface.dart';

final class GetPostsUsecase {
  GetPostsUsecase({this.api}) {
    api = api ?? getIt<HomeRepositoryInterface>();
  }

  late HomeRepositoryInterface? api;

  EitherErrorOrResponse<List<PostResponseModel>> call() async {
    List<PostResponseModel> res = await api!.getPosts();
    if (res.isNotEmpty) {
      try {
        return (err: null, res: res);
      } catch (e) {
        "GetPostsUsecase:: $e".debugString;
        
        var error = ErrorParser(
            code: "000",
            status: "ERROR_PARSING_JSON",
            message: "$e",
            timeStamp: DateTime.timestamp());
        return (err: error, res: null);
      }
    }

    var error = res as ErrorParser;
    return (err: error, res: null);
  }
}