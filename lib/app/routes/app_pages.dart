import 'package:astumentor/app/modules/Post/views/comment_view.dart';
import 'package:get/get.dart';

import '../modules/Post/bindings/post_binding.dart';
import '../modules/Post/views/post_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/panorama/bindings/panorama_binding.dart';
import '../modules/panorama/views/panorama_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding(),
        transition: Transition.leftToRight),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
        name: _Paths.REGISTER,
        page: () => RegisterView(),
        binding: RegisterBinding(),
        transition: Transition.zoom),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.PANORAMA,
      page: () => PanoramaView(),
      binding: PanoramaBinding(),
    ),
    GetPage(
      name: _Paths.COMMENT,
      page: () => CommentView(),
      binding: PostBinding(),
    ),
  ];
}
