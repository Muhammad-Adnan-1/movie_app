import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/shared/assets/my_svgs.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final String? hintText;
  final Function(String? text)? onChanged;
  final Function(String? text)? onFieldSubmitted;

  const CustomTextField(
      {super.key,
      this.controller,
      this.focusNode,
      this.inputType,
      this.hintText,
      this.onChanged,
      this.onFieldSubmitted});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType ?? TextInputType.text,
      focusNode: widget.focusNode,
      style: theme.textTheme.bodyMedium?.copyWith(height: 1.2),
      onFieldSubmitted: (t) {
        widget.focusNode?.unfocus();
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(t);
        }
      },
      onChanged: (text) {},
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        filled: true,
        prefixIconConstraints: const BoxConstraints(
            maxWidth: 50, minHeight: 1, minWidth: 18, maxHeight: 50),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: SvgPicture.asset(
            MySvg.searchSVG,
            width: 18,
            height: 18,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            widget.controller?.text = "";
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!("");
            }
          },
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            MySvg.closeSVG,
            width: 24,
            height: 24,
          ),
        ),
        fillColor: const Color(0xffF2F2F6),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0x4D202C43), fontWeight: FontWeight.w400, height: 1.2),
      ),
    );
  }
}
