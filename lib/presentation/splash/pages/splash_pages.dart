import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_app/core/ui/constants/app_colors.dart';
import 'package:tz_app/core/ui/constants/app_text.dart';
import 'package:tz_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:tz_app/presentation/auth/pages/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<AuthCubit>(context),
              child: const AuthPage(),
            );
          },
        ),
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppText.welcome,
              style: TextStyle(
                fontSize: 50,
                color: AppColors.white,
              ),
            ),
            SizedBox(width: 6),
            Icon(
              Icons.drive_eta,
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
