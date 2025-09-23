import 'package:get/get.dart';

import '../modules/biriyani/bindings/biriyani_binding.dart';
import '../modules/biriyani/views/biriyani_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/curent_location/bindings/curent_location_binding.dart';
import '../modules/curent_location/views/curent_location_view.dart';
import '../modules/custom_bottoom_bar/bindings/custom_bottoom_bar_binding.dart';
import '../modules/custom_bottoom_bar/views/custom_bottoom_bar_view.dart';
import '../modules/email_verification/bindings/email_verification_binding.dart';
import '../modules/email_verification/views/email_verification_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onbording1/bindings/onbording1_binding.dart';
import '../modules/onbording1/views/onbording1_view.dart';
import '../modules/onbording2/bindings/onbording2_binding.dart';
import '../modules/onbording2/views/onbording2_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/search_bar/bindings/search_bar_binding.dart';
import '../modules/search_bar/views/search_bar_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signup_otp/bindings/signup_otp_binding.dart';
import '../modules/signup_otp/views/signup_otp_view.dart';
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
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.ONBORDING1,
      page: () => const Onbording1View(),
      binding: Onbording1Binding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.ONBORDING2,
      page: () => const Onbording2View(),
      binding: Onbording2Binding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => EmailVerificationView(),
      binding: EmailVerificationBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () =>  ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.BIRIYANI,
      page: () => const BiriyaniView(),
      binding: BiriyaniBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.SEARCH_BAR,
      page: () => const SearchBarView(),
      binding: SearchBarBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.CURENT_LOCATION,
      page: () => CurentLocationView(),
      binding: CurentLocationBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () =>  SignupView(),
      binding: SignupBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.CUSTOM_BOTTOOM_BAR,
      page: () => CustomBottoomBarView(),
      binding: CustomBottoomBarBinding(),
      transition: Transition.rightToLeft, // 👈 animation defined here
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.SIGNUP_OTP,
      page: () => SignupOtpView(),
      binding: SignupOtpBinding(),
    ),
  ];
}
