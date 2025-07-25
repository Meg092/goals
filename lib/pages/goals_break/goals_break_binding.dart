import 'package:get/get.dart';

import 'goals_break_logic.dart';

class GoalsBreakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalsBreakLogic());
  }
}
