import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/routes/app_routes.dart';
import 'package:austere/feature/temp/logic/controller/home/home_controller.dart';
import 'package:austere/feature/temp/logic/controller/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? Colors.white : Colors.black,
              size: 24.sp,
            ),
            onPressed: () {
              Get.offAllNamed(AppRoutes.login);
            },
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: isDark ? Colors.white : Colors.black,
                size: 24.sp,
              ),
              onPressed: () {
                themeController.toggleTheme();
              },
            ),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 120.h),

              // Profile Image
              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: controller.imageUrl.value.isNotEmpty
                    ? NetworkImage(controller.imageUrl.value)
                    : const AssetImage("assets/profile_placeholder.png")
                        as ImageProvider,
              ),

              SizedBox(height: 20.h),

              // Name Field
              _buildTextField(
                label: "Name",
                controller: controller.nameController,
                icon: Icons.person,
                isDark: isDark,
              ),
              SizedBox(height: 15.h),

              // Bio Field
              _buildTextField(
                label: "Bio",
                controller: controller.bioController,
                icon: Icons.info_outline,
                isDark: isDark,
              ),
              SizedBox(height: 15.h),

              // Image URL Field
              _buildTextField(
                label: "Profile Image URL",
                controller: controller.imageUrlController,
                icon: Icons.link,
                isDark: isDark,
              ),

              SizedBox(height: 30.h),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? AppColors.primary : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: controller.updateProfile,
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Go to List Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? AppColors.primary : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.usersList);
                  },
                  child: Text(
                    "Go to List of Users",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required bool isDark,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 16.sp),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 14.sp),
        prefixIcon: Icon(icon, size: 22.sp),
        filled: true,
        fillColor: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
