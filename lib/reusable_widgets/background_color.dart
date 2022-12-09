import 'package:anime/utils/color_utils.dart';
import 'package:flutter/material.dart';

Container backColor({
  required BuildContext context,
  required Widget child,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          hexStringToColor('CB2B93'),
          hexStringToColor('9546C4'),
          hexStringToColor('5E61F4'),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}
