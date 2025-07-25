import 'package:get/get.dart';

import 'goals_focus_logic.dart';

class GoalsFocusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GoalsFocusLogic(),
      permanent: true,
    );
  }
}
