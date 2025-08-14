import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/utils/exensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.borderColor,
    this.width,
    this.showShadow = true,
    this.color,
    this.backgroundColor,
    this.backgroundGradient,
  });

  final VoidCallback onPressed;
  final String? text;
  final Widget? icon;
  final Color? borderColor;
  final double? width;
  final bool showShadow;
  final Color? color;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;

    return Container(
      width: width ?? context.width,
      height: 65.sp,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        color: backgroundGradient == null ? bgColor : null,
        border: Border.all(color: borderColor ?? bgColor),
        borderRadius: BorderRadius.circular(114.sp / 2),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: bgColor.withOpacity(0.3),
                  blurRadius: 10.sp,
                  offset: const Offset(0, 5),
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(114.sp / 2),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                if (text != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(
                      text!,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontWeight: FontWeight.w500,
                        color: color ?? AppColors.white,
                        
                      ),
                    ),
                  ),
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: icon!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomButtonOnboarding extends StatelessWidget {
  const CustomButtonOnboarding({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.borderColor,
    this.width,
    this.showShadow = true,
    this.color,
    this.backgroundColor,
    this.backgroundGradient,
    this.textAlignment = Alignment.center, 
  });

  final VoidCallback onPressed;
  final String? text;
  final Widget? icon;
  final Color? borderColor;
  final double? width;
  final bool showShadow;
  final Color? color;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;
  final Alignment textAlignment; // 

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;

    return Container(
      width: width ?? context.width,
      height: 65.sp,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        color: backgroundGradient == null ? bgColor : null,
        border: Border.all(color: borderColor ?? bgColor,width: 3.sp),
        borderRadius: BorderRadius.circular(114.sp / 2),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: bgColor.withOpacity(0.1),
                  blurRadius: 10.sp,
                  offset: const Offset(0, 5),
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(114.sp / 2),
          onTap: onPressed,
          child: Stack(
            children: [
              if (text != null)
                Align(
                  alignment: textAlignment,
                  child: Text(
                    text!,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                      fontWeight: FontWeight.w600,
                      color: color ?? AppColors.white,
                    ),
                  ),
                ),
              if (icon != null)
                Positioned(
                  right: 24.sp,
                  child: icon!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}