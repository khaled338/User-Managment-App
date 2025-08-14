import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/routes/app_routes.dart';
import 'package:austere/feature/temp/logic/controller/theme/theme_controller.dart';
import 'package:austere/feature/temp/logic/controller/user_list/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UsersListScreen extends StatelessWidget {
  UsersListScreen({super.key});
  final UsersListController controller = Get.put(UsersListController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back,
                color: isDark ? Colors.white : Colors.black, size: 24.sp),
            onPressed: () {
              Get.offAllNamed(AppRoutes.home);
            },
          ),
        ),
        title: Text(
          "Users List",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(() => IconButton(
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
              )),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.usersList.isEmpty) {
          return Center(
            child: Text(
              "No users found",
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemCount: controller.usersList.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final user = controller.usersList[index];

            return TweenAnimationBuilder(
              duration: Duration(milliseconds: 300 + (index * 100)),
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.easeOut,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, (1 - value) * 20.h),
                    child: child,
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                color: isDark ? AppColors.primary : Colors.white,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  leading: CircleAvatar(
                    radius: 28.r,
                    backgroundImage: user['imageUrl'] != null &&
                            user['imageUrl'].toString().isNotEmpty
                        ? NetworkImage(user['imageUrl'])
                        : const AssetImage('assets/default_avatar.png')
                            as ImageProvider,
                  ),
                  title: Text(
                    user['name'] ?? 'No Name',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  subtitle: Text(
                    user['bio'] ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18.sp,
                    color: theme.iconTheme.color,
                  ),
                  onTap: () {
                    // تفاصيل البروفايل
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}