import 'package:flutter/material.dart';

customSuperBig(BuildContext context,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    bool? light,
    bool? bold}) {
  return TextStyle(
    color: color,
    fontSize: fontSize ?? 22,
    fontWeight: light == true
        ? FontWeight.w400
        : bold == true
            ? FontWeight.w700
            : fontWeight,
  );
}

customBig(BuildContext context,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    bool? light,
    bool? bold}) {
  return TextStyle(
    color: color,
    fontSize: fontSize ?? 18,
    fontWeight: light == true
        ? FontWeight.w400
        : bold == true
            ? FontWeight.w700
            : fontWeight,
  );
}

customMedium(BuildContext context,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    bool? light,
    bool? bold}) {
  return TextStyle(
    color: color,
    fontSize: fontSize ?? 14,
    fontWeight: light == true
        ? FontWeight.w400
        : bold == true
            ? FontWeight.w700
            : fontWeight,
  );
}

customSmall(BuildContext context,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    bool? light,
    bool? bold}) {
  return TextStyle(
    color: color,
    fontSize: fontSize ?? 10,
    fontWeight: light == true
        ? FontWeight.w300
        : bold == true
            ? FontWeight.w700
            : FontWeight.w400,
  );
}
