import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:set_goals/db_goals/db_goals.dart';
import 'package:set_goals/db_goals/goals_entity.dart';

class GoalsDetailsLogic extends GetxController {

  DBGoals dbGoals = Get.find<DBGoals>();

  int setTimeNum = 0;
  int actualTimeNum = 0;
  String name = '';
  int type = 0;

  Timer? _timer;
  var timeStr = '00:00:00'.obs;

  void startTimer() {
    stopTimer();
    getData();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (actualTimeNum > 0) {
        actualTimeNum--;
        getData();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void getData() {
    final hours = actualTimeNum ~/ 3600;
    final minutes = (actualTimeNum-hours*3600) ~/ 60;
    final seconds = actualTimeNum % 60;
    final result =
        '${hours > 9 ? hours : '0$hours'}:${minutes > 9 ? minutes : '0$minutes'}:${seconds > 9 ? seconds : '0$seconds'}';
    timeStr.value = result;
  }

  void addData() async {
    stopTimer();
    final entity = GoalsEntity(id: 0, createdTime: DateTime.now(), name: name, setTime: setTimeNum, actualTime: setTimeNum-actualTimeNum);
    await dbGoals.insertGoals(entity);
    Fluttertoast.showToast(msg: 'Save success');
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Map info = Get.arguments;
    setTimeNum = info['setTime'];
    actualTimeNum = setTimeNum;
    name = info['name'];
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    stopTimer();
    super.onClose();
  }

}
