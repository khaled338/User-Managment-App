import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:austere/core/consts/app_colors.dart';
import 'dart:math';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _sizeController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

    _sizeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800), lowerBound: 0.9, upperBound: 1.1)..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([_rotationController, _sizeController]),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Pulsing Central Circle (Always a circle)
              Container(
                width: 50 * _sizeController.value,
                height: 50 * _sizeController.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withOpacity(0.75), // Uses AppColors.primary
                ),
              ),

              // Orbiting Dots (Always circles)
              ...List.generate(5, (index) {
                double angle = (pi * 2 * index) / 5 + (_rotationController.value * pi * 2);
                double radius = 55;
                return Positioned(
                  left: 60 + radius * cos(angle) - 10,
                  top: 60 + radius * sin(angle) - 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary, // Slight opacity variation
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _sizeController.dispose();
    super.dispose();
  }
}

startLoading() {
  showDialog(context: Get.context!, barrierDismissible: false, useSafeArea: true, builder: (context) => const CustomLoader());
}

stopLoading() {
  Get.back();
}
