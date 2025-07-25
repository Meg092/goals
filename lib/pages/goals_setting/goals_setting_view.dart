import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'goals_setting_logic.dart';

class GoalsSettingPage extends GetView<GoalsSettingLogic> {

  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records','Version'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 0 ? const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        ) : const Text("1.0.0")
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanGoalsData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting'),),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context)
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white, borderRadius: BorderRadius.circular(12))
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).marginAll(15)),
      ),
    );
  }
}
