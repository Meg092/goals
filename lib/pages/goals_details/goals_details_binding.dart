import 'package:get/get.dart';

import 'goals_details_logic.dart';

class GoalsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalsDetailsLogic());
  }
}
