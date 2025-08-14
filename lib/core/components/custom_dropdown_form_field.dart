import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/utils/exensions.dart';

class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField({super.key, required this.items, required this.onChanged, this.value, this.icon, this.hintText, this.validator, this.color, this.title, this.toolTipMessage});

  final List<DropdownMenuItem>? items;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final Widget? icon;
  final String? hintText;
  final String? title;
  final String? toolTipMessage;
  final String? Function(dynamic)? validator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        DropdownButtonFormField(
          padding: EdgeInsets.zero,
          items: items,
          style: Get.textTheme.bodySmall,
          onChanged: onChanged,
          value: value,
          icon: icon,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: color ?? Colors.white,
            hintStyle: TextStyle(color: const Color(0xFF949D9E), fontSize: Theme.of(context).textTheme.titleSmall!.fontSize, fontWeight: FontWeight.bold),
            errorStyle: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.w400),
            disabledBorder: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            border: buildBorder(),
          ),
          validator: validator,
          menuMaxHeight: 200,
          dropdownColor: AppColors.white,
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 1, color: AppColors.primary.withOpacity(0.10)));
  }
}
