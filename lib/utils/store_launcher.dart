import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class StoreLauncher {
  void openStore({required String androidAppId, required String iosAppId}) {
    if (Platform.isAndroid || Platform.isIOS) {
      String appId = Platform.isAndroid ? androidAppId : iosAppId;
      final url = Uri.parse(
        //For AppGallery (Huawei)
        Platform.isAndroid ? "https://appgallery.huawei.com/app/C105418921" : "https://apps.apple.com/app/id$appId",
        //For Google Play
        // Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
