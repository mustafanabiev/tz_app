import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_app/core/ui/constants/app_routers.dart';
import 'package:tz_app/data/datasource/drive_remote_data_source.dart';
import 'package:tz_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:tz_app/presentation/auth/pages/auth_page.dart';
import 'package:tz_app/presentation/home/cubit/home/home_cubit.dart';
import 'package:tz_app/presentation/home/cubit/tab_bar/tab_bar_cubit.dart';
import 'package:tz_app/presentation/home/pages/home_page.dart';
import 'package:tz_app/presentation/splash/pages/splash_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabBarCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => HomeCubit(DriveRemoteDataSource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.auth: (context) => const AuthPage(),
          AppRoutes.home: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<TabBarCubit>(context),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<HomeCubit>(context),
                  ),
                ],
                child: const HomePage(),
              ),
        },
      ),
    );
  }
}
