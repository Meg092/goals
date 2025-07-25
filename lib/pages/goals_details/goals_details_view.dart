import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:set_goals/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'goals_details_logic.dart';

class GoalsDetailsPage extends GetView<GoalsDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: GetBuilder<GoalsDetailsLogic>(builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      Image.asset(
                        'assets/icon.webp',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 344,
                        height: 53,
                        alignment: Alignment.center,
                        child: Text(
                          controller.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ).decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      Obx(() {
                        return Text(
                          controller.timeStr.value,
                          style: const TextStyle(
                              fontSize: 51, fontWeight: FontWeight.bold),
                        ).marginSymmetric(vertical: 20);
                      }),
                      <Widget>[
                        Container(
                          width: 88,
                          height: 88,
                          alignment: Alignment.center,
                          child: const Text(
                            'Stop',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                            .decorated(
                            color: const Color(0xffcc3f3a),
                            borderRadius: BorderRadius.circular(44))
                            .gestures(onTap: () {
                          controller.addData();
                        }),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 88,
                          height: 88,
                          alignment: Alignment.center,
                          child: Text(
                            controller.type == 0 ? 'Pause' : 'Continue',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                            .decorated(
                            color: controller.type == 0
                                ? primaryColor
                                : const Color(0xff28a52d),
                            borderRadius: BorderRadius.circular(44))
                            .gestures(onTap: () {
                          if (controller.type == 0) {
                            controller.type = 1;
                            controller.stopTimer();
                          } else {
                            controller.type = 0;
                            controller.startTimer();
                          }
                          controller.update();
                        })
                      ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                    ].toColumn(),
                  );
                }).marginAll(15)),
          ),
        ));
  }
}
