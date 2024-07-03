import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search by the keyword...',
        hintStyle: const TextStyle(color: AppColors.darkGray),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: () => RouteUtils.pop(),
            child: const Icon(
              Icons.close,
              color: AppColors.darkGray,
            ),
          ),
        ),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        filled: true,
        fillColor: AppColors.gray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
