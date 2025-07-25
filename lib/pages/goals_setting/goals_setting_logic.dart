import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:set_goals/db_goals/db_goals.dart';
import 'package:set_goals/pages/goals_main/goals_main_logic.dart';

class GoalsSettingLogic extends GetxController {

  DBGoals dbGoals = Get.find<DBGoals>();

  cleanGoalsData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbGoals.cleanAllData();
           GoalsMainLogic mainLogic = Get.find<GoalsMainLogic>();
           mainLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutGoalsUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 72,
        height: 72,
      ),
      children: [
        const Text(
            """We can record the time you spend doing things"""),
      ],
      context: context,
    );
  }

}
