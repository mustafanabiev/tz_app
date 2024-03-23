import 'package:flutter/material.dart';
import 'package:tz_app/core/ui/constants/app_colors.dart';
import 'package:tz_app/core/ui/constants/app_text_styles.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyles.textStyleF16(Colors.grey),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        contentPadding: const EdgeInsets.all(18),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        suffixIcon: const Icon(
          Icons.my_location_outlined,
          color: AppColors.green,
        ),
        hintStyle: AppTextStyles.textStyleF16(Colors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите текст';
        }
        return null;
      },
    );
  }
}
