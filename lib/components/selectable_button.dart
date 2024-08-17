import 'package:albedo/components/colours.dart';
import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  final String label;
  final double width;
  final double height;
  final Function(bool, String) onSelected; 

  SelectableButton({
    required this.label,
    required this.width,
    required this.height,
    required this.onSelected,
  });

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onSelected(_isSelected, widget.label); 
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = widget.width * 0.1;
    double iconSize = widget.width * 0.1;

    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.symmetric(vertical: widget.height * 0.1),
        decoration: BoxDecoration(
          color: _isSelected ? Color(0xFF6A1B9A) : AppColors.secondary,
          borderRadius: BorderRadius.circular(widget.height * 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: widget.width * 0.05),
            Icon(
              Icons.add,
              color: Colors.black,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
