import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:set_goals/db_goals/db_goals.dart';

import '../../db_goals/goals_entity.dart';

class GoalsMainLogic extends GetxController {

  DBGoals dbGoals = Get.find<DBGoals>();

  var list = <GoalsEntity>[].obs;

  int type = 0;
  DateTime currentDate = DateTime.now();
  String name = '';

  void getData() async {
    list.value = await dbGoals.getGoalsAllData();
  }

  void addGoal() async {
    final setTimeNum = currentDate.hour*60*60+currentDate.minute*60+currentDate.second;
    if (setTimeNum <= 0) {
      Fluttertoast.showToast(msg: 'Please select the valid time');
      return;
    }
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the name');
      return;
    }
    Map info = {'name':name,'setTime':setTimeNum};
    Get.toNamed('/goals_details',arguments:  info)?.then((_) {
      getData();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
