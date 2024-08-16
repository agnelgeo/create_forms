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
                  color: Color(0xFF874590), 
                  width: 2.0,
                ),
                color: isSelected ? Color(0xFF874590) : Colors.transparent,
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
              color: Color(0xFF874590), 
            ),
          ),
        ],
      ),
    );
  }
}
