import 'package:dietfast1/cor/enums/device_type.dart';
import 'package:dietfast1/cor/functions/get_device_type.dart';
import 'package:dietfast1/view/Ask_view/ask_view.dart';
import 'package:dietfast1/shared/const/clippath.dart';
import 'package:dietfast1/shared/const/on_pording_model.dart';
import 'package:dietfast1/shared/values/app_strings.dart';
import 'package:dietfast1/shared/values/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnPordingScreenView extends StatelessWidget {
  OnPordingScreenView({Key? key}) : super(key: key);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //============================>>   Mobile Device
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double height = mediaQueryData.orientation == Orientation.landscape
        ? mediaQueryData.size.width
        : mediaQueryData.size.height;
    double width = mediaQueryData.size.width;
    List fontSizedMobile = [25.0, 10.0, 15.0];
    //==================[title ,  body , bottom]
    List<double> padingSizedMobile = [20.0, 40.0, 10.0];
    //============================[body , bottom horez , bottom virtecal ]
    List<double> widgetHeightMobile = [height * .65, height * .35, 10];
    List<double> widgetWidthMobile = [width, 10];

    // //============================>>   Tablet Device

    List fontSizedTablet = [30.0, 15.0, 20.0];
    //==================[title ,  body , bottom]

    List<double> padingSizedTablet = [20.0, 40.0, 10.0];
    //============================>>[body , bottom horez , bottom virtecal ]
    List<double> widgetHeightTablet = [height * .65, height * .35, 15];
    List<double> widgetWidthTablet = [width, 15];

    //=========>>[body image , content   ]
    // //============================>>   DeskTop Device

    List fontSizedDeskTop = [40.0, 25.0, 25.0];
    //==================[title ,  body , bottom]

    List<double> padingSizedDeskTop = [20.0, 40.0, 10.0];
    //============================>>[body , bottom horez , bottom virtecal ]
    List<double> widgetHeightDeskTop = [height * .65, height * .35, 20];
    //=========>>[body image , content   ]

    List<double> widgetWidthDeskTop = [width, 20];
    //=========>>[body ]

    return getDeviceType(mediaQueryData) == DeviceType.mobile
        ? OnPordingWidget(
            width: width,
            height: height,
            pageController: pageController,
            widgetHeightMobile: widgetHeightMobile,
            widgetWidthMobile: widgetWidthMobile,
            padingSizedMobile: padingSizedMobile,
            fontSizedMobile: fontSizedMobile)
        : getDeviceType(mediaQueryData) == DeviceType.tablet
            ? OnPordingWidget(
                width: width,
                height: height,
                pageController: pageController,
                widgetHeightMobile: widgetHeightTablet,
                widgetWidthMobile: widgetWidthTablet,
                padingSizedMobile: padingSizedTablet,
                fontSizedMobile: fontSizedTablet)
            : OnPordingWidget(
                width: width,
                height: height,
                pageController: pageController,
                widgetHeightMobile: widgetHeightDeskTop,
                widgetWidthMobile: widgetWidthDeskTop,
                padingSizedMobile: padingSizedDeskTop,
                fontSizedMobile: fontSizedDeskTop);
  }
}

class OnPordingWidget extends StatelessWidget {
  const OnPordingWidget({
    super.key,
    required this.pageController,
    required this.widgetHeightMobile,
    required this.widgetWidthMobile,
    required this.padingSizedMobile,
    required this.fontSizedMobile,
    this.width,
    this.height,
  });

  final PageController pageController;
  final List<double> widgetHeightMobile;
  final List<double> widgetWidthMobile;
  final List<double> padingSizedMobile;
  final List fontSizedMobile;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(textScaleFactor: 1),
      child: Scaffold(
        body: ListView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: onpording.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  children: [
                    SizedBox(
                      height: widgetHeightMobile[0],
                      width: widgetWidthMobile[0],
                      child: ClipPath(
                        clipper: WaveClip(),
                        child: SizedBox(
                          child: Image.asset(onpording[index].image,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widgetHeightMobile[1],
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: padingSizedMobile[0]),
                        child: Column(
                          children: [
                            DotsIndicator(
                              dotsCount: onpording.length,
                              position: index.toDouble(),
                              decorator: DotsDecorator(
                                activeSize: Size(widgetWidthMobile[1],
                                    widgetHeightMobile[2]),
                                size: Size(widgetWidthMobile[1],
                                    widgetHeightMobile[2]),
                                color: Colors.black26, // Inactive color
                                activeColor: AppColors.blue,
                              ),
                            ),
                            SizedBox(
                              height: height! * .04,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                onpording[index].title,
                                style: TextStyle(
                                    fontSize: fontSizedMobile[0],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: height! * .02,
                            ),
                            Text(
                              onpording[index].body,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: fontSizedMobile[1],
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      AppStrings.skip,
                                      style: TextStyle(
                                          fontSize: fontSizedMobile[2],
                                          color: Colors.black54),
                                    )),
                                TextButton(
                                  onPressed: () {
                                    if (index == onpording.length - 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AskView(),
                                          ));
                                    } else {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: padingSizedMobile[1],
                                              vertical: padingSizedMobile[2])),
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => AppColors.crayola)),
                                  child: Text(
                                    AppStrings.next,
                                    // textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSizedMobile[2]),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
