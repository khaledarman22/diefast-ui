import 'package:dietfast1/shared/values/app_strings.dart';
import 'package:flutter/material.dart';

import '../../cor/enums/device_type.dart';
import '../../cor/functions/get_device_type.dart';
import '../../shared/const/clippath.dart';
import '../../shared/values/app_image.dart';
import '../../shared/values/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double width = mediaQueryData.size.width;
    double height = mediaQueryData.orientation == Orientation.landscape
        ? mediaQueryData.size.width
        : mediaQueryData.size.height;
    List<double> fontSizedMobile = [35.0, 15.0];
    List<double> padingSizedMobile = [];
    List<double> widgetHeightMobile = [
      height * .1,
      height * .04,
      height * .25,
      height * .05,
      height * .03,
      height * .17,
      20.0
    ];
    List<double> widgetWidthMobile = [30.0, width * .8];
    List<double> fontSizedTablet = [45.0, 20.0];
    List<double> padingSizedTablet = [];
    List<double> widgetHeightTablet = [
      height * .08,
      height * .04,
      height * .25,
      height * .05,
      height * .03,
      height * .15,
      30
    ];
    List<double> widgetWidthTablet = [30.0, width * .4];

    List<double> fontSizedDeskTop = [55.0, 30.0];
    List<double> padingSizedDeskTop = [];
    List<double> widgetHeightDeskTop = [
      height * .08,
      height * .04,
      height * .2,
      height * .05,
      height * .03,
      height * .15,
      50.0
    ];
    List<double> widgetWidthDeskTop = [30.0, width * .4];

    return getDeviceType(mediaQueryData) == DeviceType.mobile
        ? homePageWidget(
            key: key,
            height: height,
            width: width,
            fontSized: fontSizedMobile,
            padingSized: padingSizedMobile,
            widgetHeight: widgetHeightMobile,
            widgetWidth: widgetWidthMobile,
          )
        : getDeviceType(mediaQueryData) == DeviceType.tablet
            ? homePageWidget(
                key: key,
                height: height,
                width: width,
                fontSized: fontSizedTablet,
                padingSized: padingSizedTablet,
                widgetHeight: widgetHeightTablet,
                widgetWidth: widgetWidthTablet,
              )
            : homePageWidget(
                key: key,
                height: height,
                width: width,
                fontSized: fontSizedDeskTop,
                padingSized: padingSizedDeskTop,
                widgetHeight: widgetHeightDeskTop,
                widgetWidth: widgetWidthDeskTop,
              );
  }

  MediaQuery homePageWidget(
      {GlobalKey<ScaffoldState>? key,
      double? height,
      double? width,
      List<double>? widgetHeight,
      List<double>? padingSized,
      List<double>? widgetWidth,
      List<double>? fontSized}) {
    return MediaQuery(
        data: const MediaQueryData(
          textScaleFactor: 1,
        ),
        child: Scaffold(
          key: key,
          drawer: Drawer(
              width: widgetWidth![1],
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: widgetHeight![2],
                            child: Image.asset(
                              AppImage.spalshDr,
                              fit: BoxFit.cover,
                            )),
                        const Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: widgetHeight[3],
                        ),
                        drawerItem(
                          fontSized: fontSized!,
                          widgetWidth: widgetWidth,
                          assetName: AppImage.home,
                          title: AppStrings.home,
                        ),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        drawerItem(
                          fontSized: fontSized,
                          widgetWidth: widgetWidth,
                          assetName: AppImage.profile,
                          title: AppStrings.clientProfile,
                        ),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        drawerItem(
                          fontSized: fontSized,
                          widgetWidth: widgetWidth,
                          assetName: AppImage.awesomelist,
                          title: AppStrings.services,
                        ),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        drawerItem(
                          fontSized: fontSized,
                          widgetWidth: widgetWidth,
                          assetName: AppImage.price,
                          title: AppStrings.offers,
                        ),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        drawerItem(
                          fontSized: fontSized,
                          widgetWidth: widgetWidth,
                          assetName: AppImage.about,
                          title: AppStrings.aboutUs,
                        ),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        drawerItem(
                          fontSized: fontSized,
                          widgetWidth: widgetWidth,
                          assetName: AppImage.customeservice,
                          title: AppStrings.contactUs,
                        ),
                        SizedBox(
                          height: widgetHeight[4],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: widgetHeight[6],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              callme(
                                image: AppImage.instagram,
                                fontSized: fontSized,
                              ),
                              callme(
                                  image: AppImage.twitter,
                                  fontSized: fontSized),
                              callme(
                                  image: AppImage.facebook,
                                  fontSized: fontSized),
                              callme(
                                  image: AppImage.call, fontSized: fontSized),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: widgetHeight[2],
                            child: Image.asset(AppImage.underdrour)),
                      ],
                    ),
                  ),
                ),
              )),
          body: Column(
            children: [
              SizedBox(
                height: widgetHeight[5],
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipPath(
                      clipper: WaveClipGome(),
                      child: Container(
                        height: widgetHeight[0],
                        width: double.infinity,
                        color: AppColors.crayola,
                      ),
                    ),
                    Positioned(
                        bottom: widgetHeight[1],
                        left: 0,
                        child: IconButton(
                            iconSize: fontSized[0],
                            onPressed: () {
                              key!.currentState!.openDrawer();
                              // keey.currentState?.openDrawer();
                            },
                            icon: ImageIcon(
                              AssetImage(AppImage.hamburger),
                            )))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  callme({required image, color, required List<double> fontSized}) {
    return ImageIcon(
      AssetImage(image),
      size: fontSized[0],
      color: color ?? AppColors.blue,
    );
  }

  drawerItem(
      {required String assetName,
      required String title,
      required List<double> fontSized,
      required List<double> widgetWidth}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(children: [
        ImageIcon(
          AssetImage(assetName),
          color: AppColors.black,
          size: fontSized[1],
        ),
        SizedBox(
          width: widgetWidth[0],
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontSized[1], fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
