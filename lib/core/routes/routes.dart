import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/page/forget_password/email_screen.dart';
import 'package:bookia/feature/auth/presentation/page/forget_password/otp_screen.dart';
import 'package:bookia/feature/auth/presentation/page/forget_password/new_password_screen.dart';
import 'package:bookia/feature/auth/presentation/page/forget_password/password_changed_screen.dart';
import 'package:bookia/feature/auth/presentation/page/login/login_screen.dart';
import 'package:bookia/feature/auth/presentation/page/register/register_screen%20.dart';
import 'package:bookia/feature/home/presentation/page/home_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcom_screen.dart';
import 'package:bookia/feature/main/main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/Register';
  static const String emailScreen = '/emailScreen';
  static const String otpScreen = '/otpScreen';
  static const String newPasswordScreen = '/NewPasswordScreen';
  static const String confirmScreen = '/confirmScreen';
  static const String mainScreen = '/mainScreen';
  static const String homeScreen = '/homeScreen';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: emailScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: EmailScreen(),
        ),
      ),
      GoRoute(
        path: otpScreen,
        builder: (context, state) =>
            BlocProvider(create: (context) => AuthCubit(), child: OTPScreen()),
      ),
      GoRoute(
        path: newPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: NewPasswordScreen(),
        ),
      ),

      GoRoute(
        path: confirmScreen,
        builder: (context, state) => PasswordChangedScreen(),
      ),

      GoRoute(path: mainScreen, builder: (context, state) => MainScreen()),

      GoRoute(
        path: homeScreen,
        builder: (context, state) =>
            BlocProvider(create: (context) => AuthCubit(), child: HomeScreen()),
      ),
    ],
  );
}
