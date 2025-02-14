import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context,
    {
      String? text,
      Widget? title,
      List<Widget>? actions,
      double? elevation,
      Color? backgroundColor,
      bool? centerTitle,
      Widget? subtitle,
      double? toolbarHeight
    }) {
  var theme = Theme.of(context);

  return AppBar(
    title: text != null
        ? Text(
            text,
            style: theme.textTheme.bodyLarge,
          )
        : title,
    toolbarHeight: toolbarHeight ?? kToolbarHeight,
    bottom: subtitle != null? PreferredSize(preferredSize: const Size.fromHeight(30), child: subtitle): null,
    actions: actions,
    elevation: elevation ?? 10,
    centerTitle: centerTitle ?? false,
    backgroundColor: backgroundColor,

  );
}
