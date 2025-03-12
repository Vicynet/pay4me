import "package:get_it/get_it.dart";
import "package:pay4me/features/home/data/repository/home.repository.dart";
import "package:pay4me/features/home/data/repository_interface/home_repository.interface.dart";
import "package:pay4me/features/home/application/usecase/get_posts.usecase.dart";

// Create the global locator instance
final GetIt getIt = GetIt.I;

void serviceLocatorInitializer() async {
  /// Data Layer DI
  getIt.registerFactory<HomeRepositoryInterface>(
      () => HomeRepository());

  /// Usecase DI
  getIt.registerFactory<GetPostsUsecase>(() => GetPostsUsecase());
}
