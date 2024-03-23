import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_app/core/ui/components/custom_button.dart';
import 'package:tz_app/core/ui/constants/app_colors.dart';
import 'package:tz_app/core/ui/constants/app_routers.dart';
import 'package:tz_app/core/ui/constants/app_text.dart';
import 'package:tz_app/presentation/auth/cubit/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                },
                text: AppText.getStarted,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () async =>
                    await context.read<AuthCubit>().launchURL(),
                text: AppText.terms,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
