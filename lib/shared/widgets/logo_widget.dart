
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {

  final double? size;
  final EdgeInsets? padding;
  final Color? logoColor;

  const LogoWidget({super.key, this.size, this.padding, this.logoColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Icon(Icons.play_arrow, size: size ?? 100, color: logoColor,),
    );
  }
}
