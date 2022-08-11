import 'package:flutter/material.dart';

const Color _primary = Color(0xfffe4141);
const Color _onPrimary = Color(0xffe7e7e7);
const Color _surface = Color(0xff1e1b26);
const Color _onSurface = Color(0xffe7e7e7);
const Color _background = Color(0xff181219);
const Color _error = Colors.red;

ColorScheme colorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: _primary,
  onPrimary: _onPrimary,
  secondary: _primary,
  onSecondary: _onPrimary,
  error: _error,
  onError: _onPrimary,
  background: _background,
  onBackground: _onPrimary,
  surface: _background,
  onSurface: _onSurface,
  primaryContainer: _surface,
);

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}
