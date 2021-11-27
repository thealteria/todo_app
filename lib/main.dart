import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/common/util/initializer.dart';
import 'package:todo_app/app/routes/app_pages.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
