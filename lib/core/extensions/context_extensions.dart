import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  MediaQueryData get mq => MediaQuery.of(this);
  Size get screenSize => mq.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mq.padding;
  bool get isDark => theme.brightness == Brightness.dark;
  bool get isTablet => screenWidth >= 600;
  bool get isDesktop => screenWidth >= 1024;
  bool get isReduceMotion => mq.disableAnimations;
}
