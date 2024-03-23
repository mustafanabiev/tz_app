import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tz_app/core/enum/fetch_status.dart';
import 'package:tz_app/core/ui/components/custom_button.dart';
import 'package:tz_app/core/ui/constants/app_colors.dart';
import 'package:tz_app/core/ui/constants/app_text.dart';
import 'package:tz_app/core/ui/constants/app_text_styles.dart';
import 'package:tz_app/presentation/home/cubit/home/home_cubit.dart';
import 'package:tz_app/presentation/home/cubit/tab_bar/tab_bar_cubit.dart';
import 'package:tz_app/presentation/home/widgets/custom_card.dart';
import 'package:tz_app/presentation/home/widgets/lines.dart';
import 'package:tz_app/presentation/home/widgets/text_form_field_widget.dart';
import 'package:tz_app/utils/tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final departureController = TextEditingController(text: 'Казань');
  final destinationController = TextEditingController(text: 'Уфа');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<HomeCubit>().getDriverData(
          departureCity: departureController.text,
          destinationCity: destinationController.text,
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TabBarCubit>().state;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
        title: const Text(AppText.appBarTitle),
        bottom: buildTabBar(state, context, _tabController),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PassengersView(
            formKey: _formKey,
            departureController: departureController,
            destinationController: destinationController,
          ),
          ListView(
            children: const [
              Icon(Icons.drive_eta),
            ],
          ),
        ],
      ),
    );
  }
}

class PassengersView extends StatelessWidget {
  const PassengersView({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.departureController,
    required this.destinationController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController departureController;
  final TextEditingController destinationController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.radio_button_checked_outlined,
                          size: 32,
                          color: AppColors.green,
                        ),
                        Column(
                          children: List.generate(3,
                              (index) => const Lines(color: AppColors.green)),
                        ),
                        const Icon(
                          Icons.radio_button_checked_outlined,
                          size: 32,
                          color: AppColors.green,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: departureController,
                              hintText: AppText.where,
                            ),
                            const SizedBox(height: 16),
                            TextFormFieldWidget(
                              controller: destinationController,
                              hintText: AppText.wheree,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.trip_origin,
                          size: 32,
                          color: AppColors.green,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          AppText.parcel,
                          style: AppTextStyles.textStyleF16(
                            AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () async =>
                            await context.read<HomeCubit>().selectDate(context),
                        icon: const Icon(
                          Icons.date_range,
                          color: AppColors.green,
                        ),
                        label: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return Text(
                              state.date ??
                                  DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now()),
                              style: AppTextStyles.textStyleF16(
                                AppColors.black,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          color: AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<HomeCubit>().getDriverData(
                                departureCity: context
                                    .read<HomeCubit>()
                                    .capitalizeFirstLetter(
                                      departureController.text,
                                    ),
                                destinationCity: context
                                    .read<HomeCubit>()
                                    .capitalizeFirstLetter(
                                      destinationController.text,
                                    ),
                                date: state.date ??
                                    DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now()),
                              );
                        }
                      },
                      text: AppText.find,
                    );
                  },
                ),
                const SizedBox(height: 30),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state.status == FetchStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.status == FetchStatus.success &&
                        state.driverData != null) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.driverData!.trips.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            driver: state.driverData!.trips[index],
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text(AppText.error));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
