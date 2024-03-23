import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tz_app/core/ui/app_colors.dart';
import 'package:tz_app/data/model/drive_model.dart';
import 'package:tz_app/presentation/widgets/custom_text.dart';
import 'package:tz_app/presentation/widgets/lines.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.driver,
  });

  final DriveModel driver;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images.jpeg',
                      ),
                    ),
                    const SizedBox(width: 14),
                    CustomText(
                      title: driver.name ?? 'Айдар',
                      title2: driver.transport ?? 'Kia Rio',
                      title3: '${driver.price} ${driver.currency}',
                      title3Color: AppColors.black,
                    ),
                  ],
                ),
                const Icon(
                  Icons.bookmark_add_outlined,
                  size: 32,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.radio_button_checked_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    Column(
                      children: List.generate(
                          4, (index) => const Lines(color: Colors.grey)),
                    ),
                    const Icon(
                      Icons.radio_button_checked_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    CustomText(
                      title: driver.departureCity ?? '',
                      title2: DateFormat('dd MMMM, H:MM').format(
                        DateTime.parse(driver.departureCityDate ??
                            DateTime.now().toString()),
                      ),
                      title3: 'Автовокзал',
                      title3Color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      title: driver.destinationCity ?? '',
                      title2: DateFormat('dd MMMM, H:MM').format(
                        DateTime.parse(driver.destinationCityDate ??
                            DateTime.now().toString()),
                      ),
                      title3: 'Автовокзал',
                      title3Color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
