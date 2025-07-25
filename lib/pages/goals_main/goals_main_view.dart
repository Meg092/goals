import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:set_goals/main.dart';
import 'package:set_goals/pages/goals_main/goals_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'goals_main_logic.dart';

class GoalsMainPage extends StatefulWidget {
  const GoalsMainPage({Key? key}) : super(key: key);

  @override
  State<GoalsMainPage> createState() => _GoalsMainPageState();
}

class _GoalsMainPageState extends State<GoalsMainPage> {
  final controller = Get.find<GoalsMainLogic>();

  void hjvgajgjsbbc() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/goals_break');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    hjvgajgjsbbc();
    super.initState();
  }

  Widget _topItem(int index) {
    final titles = ['Set goals', 'Records'];
    return Container(
      color: Colors.transparent,
      child: <Widget>[
        Text(
          titles[index],
          style: TextStyle(
              fontSize: 24,
              fontWeight:
                  controller.type == index ? FontWeight.bold : FontWeight.w400,
              color: controller.type == index
                  ? Colors.black
                  : const Color(0xff868686)),
        ),
        const SizedBox(height: 5),
        Visibility(
            visible: controller.type == index,
            child: Container(
              width: 36,
              height: 6,
            ).decorated(
                color: primaryColor, borderRadius: BorderRadius.circular(3)))
      ].toColumn(),
    ).gestures(onTap: () {
      controller.type = index;
      controller.update();
    });
  }

  Widget _item() {
    if (controller.type == 0) {
      return <Widget>[
        Expanded(
            child: <Widget>[
          const Text('Duration of the event'),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            child: <Widget>[
              <Widget>[
                const Text('Hour'),
                const Text('Minute'),
                const Text('Second')
              ]
                  .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                  .marginSymmetric(horizontal: 30),
              DateTimePickerWidget(
                dateFormat: 'HH:mm:ss',
                initDateTime: controller.currentDate,
                pickerTheme: const DateTimePickerTheme(
                    cancel: null,
                    confirm: null,
                    title: null,
                    titleHeight: 0,
                    itemHeight: 30,
                    itemTextStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                onChange: (dateTime, List<int> index) {
                  controller.currentDate = dateTime;
                },
              ),
            ].toColumn(),
          ).decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(10))
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: <Widget>[
          const Text('Event name'),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 54,
            child: GoalsTextField(
                value: controller.name,
                textAlign: TextAlign.center,
                hintText: 'Enter event name',
                maxLength: 25,
                onChange: (v) {
                  controller.name = v;
                }),
          ).decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 180,
            alignment: Alignment.center,
            child: const Text(
              'Start timing',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
              .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(90))
              .gestures(onTap: () {
            controller.addGoal();
          })
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
      ].toRow();
    }
    return Obx(() {
      return controller.list.value.isEmpty
          ? Center(
              child:const Text('No data').marginOnly(top: 80),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 298 / 151,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: controller.list.value.length,
              itemBuilder: (_, index) {
                final entity = controller.list.value[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    <Widget>[
                      Icon(
                        Icons.check_circle,
                        color: primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(child: Text(entity.name))
                    ].toRow(crossAxisAlignment: CrossAxisAlignment.start),
                    Divider(
                      height: 30,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 15,),
                    <Widget>[
                      <Widget>[
                        Text(
                          entity.setTimeString,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Set time',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )
                      ].toColumn(),
                      const SizedBox(width: 20,),
                      <Widget>[
                        Text(
                          entity.actualTimeString,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Actual time',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )
                      ].toColumn()
                    ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10));
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: [
          const Icon(
            Icons.settings,
            size: 25,
            color: Color(0xff838383),
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/goals_setting');
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<GoalsMainLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              <Widget>[_topItem(0), _topItem(1)]
                  .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              const SizedBox(height: 10),
              _item()
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
