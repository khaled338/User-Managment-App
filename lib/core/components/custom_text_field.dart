import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/utils/exensions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.title,
    this.toolTipMessage,
    this.controller,
    this.enabled,
    this.onSaved,
    this.obscureText = false,
    this.validator,
    this.borderRadius = 10,
    this.inputFormatters,
    this.maxLines = 1,
    this.onChanged,
    this.autoValidateMode,
    this.textInputAction,
  });
  final String hintText;
  final String? title;
  final String? toolTipMessage;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? borderRadius;
  final double? maxLines;
  final bool? enabled;
  final void Function(String?)? onSaved, onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Tooltip(
              message: toolTipMessage ?? '',
              child: Row(
                spacing: 5.w,
                children: [
                  Text(title!, style: TextStyle(fontSize: Theme.of(context).textTheme.titleSmall!.fontSize, fontWeight: FontWeight.bold)),
                  toolTipMessage == null
                      ? SizedBox()
                      : Tooltip(message: toolTipMessage ?? "", triggerMode: TooltipTriggerMode.tap, showDuration: Duration(seconds: toolTipMessage != null ? 3 : 0), child: Icon(Icons.help_outline_outlined, size: 14.sp)),
                ],
              ),
            ),
          ),
        TextFormField(
          textAlign: TextAlign.start,
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          onSaved: onSaved,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          validator:
              validator ??
              (v) {
                if (v!.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              },
          keyboardType: textInputType,
          maxLines: maxLines!.toInt(),
          style: TextStyle(color: const Color(0xFF1D1D1D), fontSize: Theme.of(context).textTheme.titleSmall!.fontSize, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            // suffixIcon: Container(
            //   padding: EdgeInsets.all(17.sp),
            //   width: 30.w,
            //   decoration: BoxDecoration(
            //     color: AppColors.primary,
            // borderRadius: BorderRadiusDirectional.only(
            //   topEnd: Radius.circular(borderRadius!),
            //   bottomEnd: Radius.circular(borderRadius!),
            // ),
            //   ),
            //   child: suffixIcon,
            // ),
            prefixIcon:
                prefixIcon == null
                    ? null
                    : Container(
                      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(borderRadius!), bottomStart: Radius.circular(borderRadius!))),
                      margin: EdgeInsetsDirectional.only(end: 10),
                      padding: EdgeInsets.all(17.0),
                      child: prefixIcon,
                    ),
            hintStyle: TextStyle(color: const Color(0xFF949D9E), fontSize: Theme.of(context).textTheme.titleSmall!.fontSize, fontWeight: FontWeight.bold),
            hintText: hintText,
            filled: false,
            fillColor: AppColors.white,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
          autovalidateMode: autoValidateMode,
          textInputAction: textInputAction,
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius!), borderSide: BorderSide(width: 1, color: AppColors.primary.withOpacity(0.10)));
  }
}
