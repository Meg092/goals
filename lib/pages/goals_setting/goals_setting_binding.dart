import 'package:get/get.dart';

import 'goals_setting_logic.dart';

class GoalsSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalsSettingLogic());
  }
}
