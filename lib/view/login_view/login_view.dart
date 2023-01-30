import 'package:dietfast1/cor/enums/device_type.dart';
import 'package:dietfast1/cor/functions/get_device_type.dart';
import 'package:dietfast1/view/ask_view/ask_view.dart';
import 'package:dietfast1/view/hone_app/home_app.dart';
import 'package:dietfast1/shared/const/clippath.dart';
import 'package:dietfast1/shared/values/app_image.dart';
import 'package:dietfast1/shared/values/app_strings.dart';
import 'package:flutter/material.dart';

import '../../shared/values/colors.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //  final GlobalKey globalKey = GlobalKey<FormState>();
    TextEditingController? controller1 = TextEditingController();
    TextEditingController? controller2 = TextEditingController();
    // String? Function(String?)? validator;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double width = mediaQueryData.size.width;
    double height = mediaQueryData.orientation == Orientation.landscape
        ? mediaQueryData.size.width
        : mediaQueryData.size.height;
    List<double> fontSizedMobile = [40.0, 13.0, 15];
    List<double> padingSizedMobile = [
      width * .04,
    ];
    List<double> widgetHeightMobile = [
      height * .12,
      height * .76,
      height * .10,
      height * .03,
      height * .06,
      height * .02,
      50.0
    ];
    List<double> widgetWidthMobile = [width, width * .19];
    List<double> fontSizedTablet = [35.0, 20.0, 20.0];
    List<double> padingSizedTablet = [
      width * .04,
    ];
    List<double> widgetHeightTablet = [
      height * .12,
      height * .76,
      height * .10,
      height * .03,
      height * .06,
      height * .02,
      60.0
    ];
    List<double> widgetWidthTablet = [width, width * .19];

    List<double> fontSizedDeskTop = [
      60.0,
      30.0,
      25.0,
    ];
    List<double> padingSizedDeskTop = [width * .04, width * .19];
    List<double> widgetHeightDeskTop = [
      height * .12,
      height * .76,
      height * .10,
      height * .03,
      height * .06,
      height * .02,
      70.0
    ];
    List<double> widgetWidthDeskTop = [width, width * .19];

    return getDeviceType(mediaQueryData) == DeviceType.mobile
        ? Loginwidget(
            height: height,
            width: width,
            controller1: controller1,
            controller2: controller2,
            fontSized: fontSizedMobile,
            padingSized: padingSizedMobile,
            widgetHeight: widgetHeightMobile,
            widgetWidth: widgetWidthMobile,
            globalKey: globalKey,
          )
        : getDeviceType(mediaQueryData) == DeviceType.tablet
            ? Loginwidget(
                height: height,
                width: width,
                controller1: controller1,
                controller2: controller2,
                fontSized: fontSizedTablet,
                padingSized: padingSizedTablet,
                widgetHeight: widgetHeightTablet,
                widgetWidth: widgetWidthTablet,
                globalKey: globalKey,
              )
            : Loginwidget(
                height: height,
                width: width,
                controller1: controller1,
                controller2: controller2,
                fontSized: fontSizedDeskTop,
                padingSized: padingSizedDeskTop,
                widgetHeight: widgetHeightDeskTop,
                widgetWidth: widgetWidthDeskTop,
                globalKey: globalKey,
              );
  }
}

class Loginwidget extends StatelessWidget {
  const Loginwidget({
    super.key,
    required this.globalKey,
    required this.width,
    required this.height,
    required this.widgetHeight,
    required this.widgetWidth,
    required this.padingSized,
    required this.fontSized,
    required this.controller1,
    required this.controller2,
  });

  final GlobalKey<FormState> globalKey;
  final List<double> widgetHeight;
  final List<double> widgetWidth;
  final List<double> padingSized;
  final List<double> fontSized;
  final double width;
  final double height;
  final TextEditingController controller1;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(
        textScaleFactor: 1,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -height * .02,
                    child: ClipPath(
                      clipper: ClipLopginUp(),
                      child: Container(
                        width: widgetWidth[0],
                        height: widgetHeight[0],
                        color: Colors.green[50],
                      ),
                    ),
                  ),
                  Positioned(
                    child: ClipPath(
                      clipper: ClipLopginUp(),
                      child: Container(
                        width: widgetWidth[0],
                        height: widgetHeight[0],
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: globalKey,
                child: SizedBox(
                  width: widgetWidth[0],
                  height: widgetHeight[1],
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padingSized[0]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: widgetHeight[2],
                        ),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              AppStrings.welcome,
                              style: TextStyle(
                                  fontSize: fontSized[0],
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        textFormField(
                          hintText: AppStrings.email,
                          fontSize: fontSized[2],
                          controller: controller1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return '';
                          },
                        ),
                        SizedBox(
                          height: widgetHeight[5],
                        ),
                        textFormField(
                          hintText: AppStrings.password,
                          fontSize: fontSized[2],
                          controller: controller2,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return '';
                          },
                        ),
                        SizedBox(
                          height: widgetHeight[5],
                        ),
                        Text(
                          AppStrings.forgot,
                          style: TextStyle(
                            fontSize: fontSized[1],
                          ),
                        ),
                        SizedBox(
                          height: widgetHeight[5],
                        ),
                        SizedBox(
                          height: widgetHeight[6],
                          width: width,
                          child: ElevatedButton(
                            onPressed: () {
                              // globalKey.currentState!.validate();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeView(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: AppColors.black,
                                textStyle: TextStyle(
                                    fontSize: fontSized[2],
                                    fontWeight: FontWeight.bold)),
                            child: Text(
                              AppStrings.login,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: widgetHeight[5],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.dontaccount,
                              style: TextStyle(fontSize: fontSized[1]),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                AppStrings.signup,
                                style: TextStyle(
                                    fontSize: fontSized[1],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: widgetHeight[5],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: widgetWidth[1],
                              height: widgetHeight[4],
                              child: Card(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(AppImage.facebookicon)),
                              ),
                            ),
                            SizedBox(
                              width: widgetWidth[1],
                              height: widgetHeight[4],
                              child: Card(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(AppImage.googleicon)),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: widgetHeight[0],
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: ClipPath(
                        clipper: ClipLopginunder(),
                        child: Container(
                          width: widgetWidth[0],
                          height: widgetHeight[0] + 20,
                          color: Colors.green[50],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -20,
                      child: ClipPath(
                        clipper: ClipLopginunder(),
                        child: Container(
                          width: widgetWidth[0],
                          height: widgetHeight[0] + 20,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
