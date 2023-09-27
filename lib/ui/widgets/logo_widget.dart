import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Size size;
  final bool isLight;
  const LogoWidget({required this.size, this.isLight = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
     isLight? 'assets/logo/logo_dark.png': 'assets/logo/logo_white.png',
      height: size.height,
      width: size.width,
    );
  }
}
