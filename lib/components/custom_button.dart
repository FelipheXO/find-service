import 'package:find_service/ultis/colors.dart';
import 'package:find_service/ultis/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.transparent = false,
      this.margin,
      this.height,
      this.fontSize,
      this.color,
      this.isLoading,
      this.colorLabel,
      this.radius,
      this.width,
      this.widget,
      this.padding,
      this.shadow})
      : super(key: key);

  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? color;
  final Color? colorLabel;
  final bool? isLoading;
  final double? radius;
  final bool? shadow;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      alignment: Alignment.center,
      padding: margin ?? const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8),
        child: Material(
          color: color ?? AppColor.primary,
          child: InkWell(
            splashColor: AppColor.grey,
            onTap: onPressed,
            child: Container(
              padding: padding,
              alignment: Alignment.center,
              width: width,

              height: height ?? 45,
              child: isLoading == true
                  ? const SpinKitThreeBounce(
                      size: 15,
                      color: Colors.white,
                    )
                  : widget ??
                      Text(buttonText,
                          textAlign: TextAlign.center,
                          style: customBig(context,
                              color: colorLabel ?? Colors.white,
                              fontSize: fontSize)),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
