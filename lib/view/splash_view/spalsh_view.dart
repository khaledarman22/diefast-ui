import 'dart:async';

import 'package:dietfast1/cor/enums/device_type.dart';
import 'package:dietfast1/cor/functions/get_device_type.dart';
import 'package:dietfast1/view/on_pording_screen_view/on_pording_screen_view.dart';
import 'package:flutter/material.dart';

import '../../shared/values/app_image.dart';

class SpalshScreenView extends StatefulWidget {
  const SpalshScreenView({Key? key}) : super(key: key);

  @override
  State<SpalshScreenView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SpalshScreenView> {
  Timer? timer;
  Future<void> startDelay() async {
    timer = Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnPordingScreenView(),
          ));
    });
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double width = mediaQueryData.size.width;
    double height = MediaQuery.of(context).size.height;

    //=========================================>> mobile
    List<double> widgetWidthMobile = [
      width,
    ];
    List<double> widgetheightMobile = [
      height,
      height * .5,
      height * .07,
    ];
    List<double> widgetStackMobile = [
      20,
    ];
    List<double> widgetWidthTablet = [
      width,
    ];
    List<double> widgetheightTablet = [
      height,
      height * .6,
      height * .085,
    ];
    List<double> widgetStackTablet = [
      30,
    ];
    //=========================================>> tablet
    List<double> widgetWidthDeskTop = [
      width,
    ];
    List<double> widgetheightDeskTop = [
      height,
      height * .7,
      height * .1,
    ];
    List<double> widgetStackDeskTop = [
      50,
    ];
    //=========================================>> desktop
    return getDeviceType(mediaQueryData) == DeviceType.mobile
        ? SplashWidget(
            widgetWidthMobile: widgetWidthMobile,
            widgetheightMobile: widgetheightMobile,
            widgetStackMobile: widgetStackMobile)
        : getDeviceType(mediaQueryData) == DeviceType.tablet
            ? SplashWidget(
                widgetWidthMobile: widgetWidthTablet,
                widgetheightMobile: widgetheightTablet,
                widgetStackMobile: widgetStackTablet)
            : SplashWidget(
                widgetWidthMobile: widgetWidthDeskTop,
                widgetheightMobile: widgetheightDeskTop,
                widgetStackMobile: widgetStackDeskTop);
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    super.key,
    required this.widgetWidthMobile,
    required this.widgetheightMobile,
    required this.widgetStackMobile,
  });

  final List<double> widgetWidthMobile;
  final List<double> widgetheightMobile;
  final List<double> widgetStackMobile;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Scaffold(
        body: Container(
          width: widgetWidthMobile[0],
          height: widgetheightMobile[0],
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImage.spalshBackground),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                      height: widgetheightMobile[1],
                      child: Image.asset(AppImage.spalshDr)),
                  Positioned(
                    bottom: widgetStackMobile[0],
                    child: SizedBox(
                        height: widgetheightMobile[2],
                        child: Image.asset(AppImage.spalshMan)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
