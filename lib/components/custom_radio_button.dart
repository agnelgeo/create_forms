import 'package:albedo/components/colours.dart';
import 'package:albedo/components/text_sizes.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  CustomRadioButton({
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged(!isSelected),
            child: Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 2.0,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: TextSizes.bodyTextSize(context), 
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
