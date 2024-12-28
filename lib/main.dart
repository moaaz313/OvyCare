import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ovacare/Core/Routing/app_routes.dart';
import 'package:ovacare/ova_care.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => OvaCare(
        appRouter: AppRoutes(), 
      ),
    ),
  );
}


