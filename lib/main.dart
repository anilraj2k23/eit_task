import 'package:eit_task/provider/provider.dart';
import 'package:eit_task/screens/screens.dart';
import 'package:eit_task/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});fl

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => UserUpdateProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(392.72, 850.90),
          minTextAdapt: true,
          builder: (BuildContext context, Widget? child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'User App',
                theme: ThemeData(
                    colorSchemeSeed: AppColors.seedColor, useMaterial3: true),
                home: RegistrationScreen(),
              )),
    );
  }
}
