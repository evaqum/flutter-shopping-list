import 'package:flutter/material.dart';

extension NavigatorX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}

extension ThemingX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Typography get typography => theme.typography;
}
