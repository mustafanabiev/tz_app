import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_app/data/datasource/drive_remote_data_source.dart';
import 'package:tz_app/presentation/cubit/home/home_cubit.dart';
import 'package:tz_app/presentation/cubit/tab_bar/tab_bar_cubit.dart';
import 'package:tz_app/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabBarCubit()),
          BlocProvider(
            create: (context) => HomeCubit(DriveRemoteDataSource()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
