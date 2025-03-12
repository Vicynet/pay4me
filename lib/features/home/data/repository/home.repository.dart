import 'package:pay4me/core/apis/interceptors/error_parser.dart';
import 'package:pay4me/features/home/data/model/response/post_response_model.dart';
import 'package:pay4me/features/home/data/repository_interface/home_repository.interface.dart';

class HomeRepository implements HomeRepositoryInterface {
  @override
  Future<List<PostResponseModel>> getPosts() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final List<PostResponseModel> dummyPosts = [
        PostResponseModel(
          id: '1',
          username: 'Paul Adah',
          handle: '@paulsunday',
          profileImage: 'https://picsum.photos/150/150',
          content:
              'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
          media: [],
          comments: 4,
          likes: 89,
          shares: 0,
          timestamp: '2025-03-11T11:23:00Z',
        ),
        PostResponseModel(
          id: '2',
          username: 'Paul Adah',
          handle: '@paulsunday',
          profileImage: 'https://picsum.photos/150/150',
          content: 'Paul Adah just got a new laptop, hehe.',
          media: [
            'https://picsum.photos/400/400',
            'https://picsum.photos/400/400',
          ],
          comments: 4,
          likes: 89,
          shares: 4,
          timestamp: '2025-03-11T11:23:00Z',
        ),
        PostResponseModel(
          id: '3',
          username: 'Paul Adah',
          handle: '@paulsunday',
          profileImage: 'https://picsum.photos/150/150',
          content: 'What is it like to study in Orlando with their',
          media: [
            'https://picsum.photos/400/400',
            'https://picsum.photos/400/400',
            'https://picsum.photos/400/400',
          ],
          comments: 4,
          likes: 89,
          shares: 0,
          timestamp: '2025-03-11T11:23:00Z',
        ),
        PostResponseModel(
          id: '4',
          username: 'Paul Adah',
          handle: '@paulsunday',
          profileImage: 'https://picsum.photos/150/150',
          content: 'What is it like to study in Orlando with their',
          media: ["https://picsum.photos/400/400"],
          comments: 4,
          likes: 89,
          shares: 0,
          timestamp: '2025-03-11T11:23:00Z',
        ),
        PostResponseModel(
          id: '5',
          username: 'Paul Adah',
          handle: '@paulsunday',
          profileImage: 'https://picsum.photos/150/150',
          content: 'What is it like to study in Orlando with their',
          media: [
            'https://picsum.photos/400/400',
            'https://picsum.photos/400/400',
            'https://picsum.photos/400/400',
            'https://picsum.photos/400/400',
          ],
          comments: 4,
          likes: 89,
          shares: 0,
          timestamp: '2025-03-11T11:23:00Z',
        ),
      ];
      return dummyPosts; 
    } catch (e) {
      var error = ErrorParser(
        code: "000",
        status: "ERROR_PARSING_JSON",
        message: "$e",
        timeStamp: DateTime.now(), 
      );
      throw error;
    }
  }
}
