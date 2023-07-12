import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionDetails extends ValueNotifier<String> {
  VersionDetails() : super('Estáve');
  getinfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    log(packageInfo.version);
  }
}
