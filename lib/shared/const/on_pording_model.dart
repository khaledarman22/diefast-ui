import 'package:dietfast1/shared/values/app_image.dart';
import 'package:dietfast1/shared/values/app_strings.dart';

class OnPordingModel {
  final String title;
  final String image;
  final String body;
  OnPordingModel(
      {required this.title, required this.image, required this.body});
}

List<OnPordingModel> onpording = [
  OnPordingModel(
    title: AppStrings.onPordingTitle1,
    image: AppImage.onpording1,
    body: AppStrings.onPordingBody1,
  ),
  OnPordingModel(
      title: AppStrings.onPordingTitle2,
      image: AppImage.onpording2,
      body: AppStrings.onPordingBody2),
  OnPordingModel(
      title: AppStrings.onPordingTitle3,
      image: AppImage.onpording3,
      body: AppStrings.onPordingBody3),
];
