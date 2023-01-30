import 'package:dietfast1/cor/enums/device_type.dart';
import 'package:dietfast1/cor/functions/get_device_type.dart';
import 'package:dietfast1/shared/values/app_image.dart';
import 'package:dietfast1/shared/values/app_strings.dart';
import 'package:flutter/material.dart';

import '../../shared/const/clippath.dart';
import '../../shared/values/colors.dart';
import '../login_view/login_view.dart';

class AskView extends StatelessWidget {
  AskView({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //  final GlobalKey globalKey = GlobalKey<FormState>();
    TextEditingController? controller1 = TextEditingController();
    TextEditingController? controller2 = TextEditingController();
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double width = mediaQueryData.size.width;
    double height = mediaQueryData.orientation == Orientation.landscape
        ? mediaQueryData.size.width
        : mediaQueryData.size.height;
    List<double> fontSizedMobile = [25.0, 14.0, 15];
    List<double> padingSizedMobile = [
      width * .04,
    ];
    List<double> widgetHeightMobile = [
      height * .12,
      height * .88,
      height * .28,
      height * .03,
      height * .06,
      height * .02
    ];
    List<double> widgetWidthMobile = [
      width,
    ];
    List<double> fontSizedTablet = [35.0, 20.0, 20.0];
    List<double> padingSizedTablet = [
      width * .04,
    ];
    List<double> widgetHeightTablet = [
      height * .12,
      height * .88,
      height * .28,
      height * .03,
      height * .06,
      height * .02
    ];
    List<double> widgetWidthTablet = [
      width,
    ];

    List<double> fontSizedDeskTop = [
      40.0,
      30.0,
      25.0,
    ];
    List<double> padingSizedDeskTop = [
      width * .04,
    ];
    List<double> widgetHeightDeskTop = [
      height * .1,
      height * .9,
      height * .28,
      height * .03,
      height * .06,
      height * .02
    ];
    List<double> widgetWidthDeskTop = [
      width,
    ];

    return getDeviceType(mediaQueryData) == DeviceType.mobile
        ? Askwidget(
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
            ? Askwidget(
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
            : Askwidget(
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

class Askwidget extends StatelessWidget {
  const Askwidget({
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
          viewInsets: EdgeInsets.fromWindowPadding(
              WidgetsBinding.instance.window.viewInsets,
              WidgetsBinding.instance.window.devicePixelRatio)),
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
                      clipper: WaveClipperTwopath(),
                      child: Container(
                        width: widgetWidth[0],
                        height: widgetHeight[0],
                        color: Colors.green[50],
                      ),
                    ),
                  ),
                  Positioned(
                    child: ClipPath(
                      clipper: WaveClipperTwopath(),
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
                          child: Image.asset(AppImage.underdrour),
                        ),
                        SizedBox(
                          height: widgetHeight[3],
                        ),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Row(
                              children: [
                                Text(
                                  AppStrings.let,
                                  style: TextStyle(
                                      fontSize: fontSized[0],
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  AppStrings.katy,
                                  style: TextStyle(
                                      fontSize: fontSized[0],
                                      color: AppColors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        textFormField(
                          hintText: AppStrings.langing1,
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
                          hintText: AppStrings.langing2,
                          fontSize: fontSized[2],
                          controller: controller2,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return '';
                          },
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                      child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // globalKey.currentState!.validate();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginView(),
                                              ));
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: fontSized[0],
                                          child: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        AppStrings.next,
                                        maxLines: 1,
                                        style:
                                            TextStyle(fontSize: fontSized[1]),
                                      ),
                                    ],
                                  )),
                                  Positioned(
                                    left: 0,
                                    child: Text(
                                      AppStrings.steps,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: fontSized[1]),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextFormField textFormField(
    {required TextEditingController controller,
    double? fontSize,
    String? hintText,
    required String? Function(dynamic) validator}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    style: TextStyle(fontSize: fontSize, color: Colors.black),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
