import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_app/core/ui/constants/app_colors.dart';
import 'package:tz_app/core/ui/constants/app_text.dart';
import 'package:tz_app/presentation/home/cubit/tab_bar/tab_bar_cubit.dart';

TabBar buildTabBar(
  int state,
  BuildContext context,
  TabController tabController,
) {
  return TabBar(
    controller: tabController,
    indicator: BoxDecoration(
      borderRadius: state == 0
          ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
      color: AppColors.green,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    onTap: (index) => context.read<TabBarCubit>().select(index),
    tabs: [
      Tab(
        child: Text(
          AppText.passenger,
          style: TextStyle(
            color: state == 0 ? AppColors.white : AppColors.black,
          ),
        ),
      ),
      Tab(
        child: Text(
          AppText.driver,
          style: TextStyle(
            color: state == 1 ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    ],
  );
}
