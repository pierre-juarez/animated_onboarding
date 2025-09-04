import 'package:animated_onboarding/onboarding_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(kIsWeb ? DevicePreview(enabled: true, builder: (context) => const MainApp()) : const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: kIsWeb ? DevicePreview.locale(context) : null,
      builder: kIsWeb ? DevicePreview.appBuilder : null,
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Banner(
        message: "Onboarding",
        location: BannerLocation.topEnd,
        child: OnboardingView(
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
        ),
      ),
    );
  }
}
