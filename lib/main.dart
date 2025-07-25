import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:set_goals/db_goals/db_goals.dart';
import 'package:set_goals/pages/goals_break/goals_break_binding.dart';
import 'package:set_goals/pages/goals_break/goals_break_view.dart';
import 'package:set_goals/pages/goals_details/goals_details_binding.dart';
import 'package:set_goals/pages/goals_details/goals_details_view.dart';
import 'package:set_goals/pages/goals_focus/goals_focus_binding.dart';
import 'package:set_goals/pages/goals_focus/goals_focus_view.dart';
import 'package:set_goals/pages/goals_main/goals_main_binding.dart';
import 'package:set_goals/pages/goals_main/goals_main_view.dart';
import 'package:set_goals/pages/goals_main/goals_main_zip.dart';
import 'package:set_goals/pages/goals_setting/goals_setting_binding.dart';
import 'package:set_goals/pages/goals_setting/goals_setting_view.dart';

Color primaryColor = const Color(0xfff2aa22);
Color bgColor = const Color(0xfff5f5f5);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await Get.putAsync(() => DBGoals().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Goals,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Goals = [
  GetPage(name: '/', page: () => const GoalsFocusView(), binding: GoalsFocusBinding()),
  GetPage(name: '/goals_main', page: () => const GoalsMainPage(), binding: GoalsMainBinding()),
  GetPage(name: '/goals_zp', page: () => GoalsMainZip()),
  GetPage(name: '/goals_setting', page: () => GoalsSettingPage(), binding: GoalsSettingBinding()),
  GetPage(name: '/goals_break', page: () => GoalsBreakView(), binding: GoalsBreakBinding()),
  GetPage(name: '/goals_details', page: () => GoalsDetailsPage(), binding: GoalsDetailsBinding()),
];
