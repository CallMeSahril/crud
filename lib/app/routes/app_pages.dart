import 'package:get/get.dart';

import 'package:crud/app/modules/addnote/bindings/addnote_binding.dart';
import 'package:crud/app/modules/addnote/views/addnote_view.dart';
import 'package:crud/app/modules/detailnote/bindings/detailnote_binding.dart';
import 'package:crud/app/modules/detailnote/views/detailnote_view.dart';
import 'package:crud/app/modules/home/bindings/home_binding.dart';
import 'package:crud/app/modules/home/views/home_view.dart';
import 'package:crud/app/modules/login/bindings/login_binding.dart';
import 'package:crud/app/modules/login/views/login_view.dart';
import 'package:crud/app/modules/profile/bindings/profile_binding.dart';
import 'package:crud/app/modules/profile/views/profile_view.dart';
import 'package:crud/app/modules/register/bindings/register_binding.dart';
import 'package:crud/app/modules/register/views/register_view.dart';
import 'package:crud/app/modules/splash/bindings/splash_binding.dart';
import 'package:crud/app/modules/splash/views/splash_view.dart';

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
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADDNOTE,
      page: () => AddnoteView(),
      binding: AddnoteBinding(),
    ),
    GetPage(
      name: _Paths.DETAILNOTE,
      page: () => DetailnoteView(),
      binding: DetailnoteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
