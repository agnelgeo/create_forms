import 'package:flutter/material.dart';

class TextSizes {
  // Text sizes for Tablet and Desktop
  static const double headingTabletDesktop = 24.0;
  static const double subheadingTabletDesktop = 16.0;
  static const double bodyTextTabletDesktop = 14.0;

  // Text sizes for Mobile
  static const double headingMobile = 20.0;
  static const double subheadingMobile = 14.0;
  static const double bodyTextMobile = 12.0;

  // Function to get appropriate text size based on screen width
  static double headingSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? headingMobile
        : headingTabletDesktop;
  }

  static double subheadingSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? subheadingMobile
        : subheadingTabletDesktop;
  }

  static double bodyTextSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? bodyTextMobile
        : bodyTextTabletDesktop;
  }
}
