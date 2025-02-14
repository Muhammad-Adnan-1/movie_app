import 'package:flutter/material.dart';

class CustomOutlinedBorderButton extends StatelessWidget {
  final Function()? onPress;
  final String buttonText;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final bool? enableBorder;
  final Size? size;
  final double? fontSize;
  final Widget? title;

  const CustomOutlinedBorderButton(
      {super.key,
        this.onPress,
        String? text,
        this.focusNode,
        this.foregroundColor,
        this.backgroundColor,
        this.borderColor,
        this.enableBorder,
        this.size,
        this.fontSize,
        this.title
      }): buttonText = (text ?? "");

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPress,
      focusNode: focusNode,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor ?? Colors.transparent),


          foregroundColor: WidgetStatePropertyAll(foregroundColor),
          fixedSize: WidgetStatePropertyAll(
              size ?? Size(MediaQuery.of(context).size.width, 50)),
          side: enableBorder == true
              ? WidgetStatePropertyAll(
              BorderSide(color: borderColor ?? theme.primaryColor))
              : null,
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ),
      child: title ??  Text(
        buttonText,
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: foregroundColor ?? theme.scaffoldBackgroundColor, fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
    );
  }
}
