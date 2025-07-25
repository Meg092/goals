import 'package:get/get.dart';

import 'goals_main_logic.dart';

class GoalsMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalsMainLogic());
  }
}
