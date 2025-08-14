import 'dart:ui';
import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/utils/exensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  RxBool isOpen = false.obs;
  RxDouble sheetHeight = 80.0.obs;
  RxDouble blurOpacity = 0.0.obs;

  void toggleSheet() {
    isOpen.toggle();
    if (isOpen.value) {
      sheetHeight.value = 244.0;
      blurOpacity.value = 0.3;
    } else {
      sheetHeight.value = 80.0;
      blurOpacity.value = 0.0;
    }
  }

  void closeSheet() {
    isOpen.value = false;
    sheetHeight.value = 80.0;
    blurOpacity.value = 0.0;
  }
}

class CustomBottomSheet extends StatelessWidget {
  final BottomSheetController controller = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Blur overlay (بيظهر فقط لما الشيت مفتوح)
          Obx(
          () => controller.isOpen.value
              ? AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: controller.blurOpacity.value,
                  child: GestureDetector(
                    onTap: controller.closeSheet,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),

        // Bottom Sheet
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: controller.sheetHeight.value,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradiant1,
                    AppColors.gradiant3,
                  ],
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: controller.toggleSheet,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Obx(() => AnimatedRotation(
                                duration: const Duration(milliseconds: 500),
                                turns: controller.isOpen.value ? 0.5 : 0,
                                child: Icon(
                                  controller.isOpen.value
                                      ? Icons.arrow_drop_up
                                      :Icons.arrow_drop_down ,
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: controller.isOpen.value
                              ? Column(
                                  key: const ValueKey(true),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _iconButton(Icons.remove_circle_rounded, Colors.red,),
                                        _iconButton(Icons.add_circle_rounded, Colors.green,),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.white.withOpacity(0.1),
                                        thickness: 1,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _navIcon('assets/images/wallet.png'),
                                        _navIcon('assets/images/group.png'),
                                        _navIcon('assets/images/setting.png'),
                                        
                                        
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                )
                              : const SizedBox.shrink(key: ValueKey(false)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget _iconButton(IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 168,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border(bottom: BorderSide(width: 3,  color: Color(0xffA09A9A))),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 48),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

 Widget _navIcon(String imagePath) {
  return Container(
    width: 48,
    height: 48,
    child: Image.asset(
      imagePath,
      fit: BoxFit.contain,
    ),
  );
}
}