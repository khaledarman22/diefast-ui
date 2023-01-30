import 'package:dietfast1/shared/values/app_num.dart';
import 'package:dietfast1/shared/values/size.dart';
import 'package:flutter/material.dart';

class WaveClipGome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - AppNumInt.n30;
    final highPoint = size.height - AppNumInt.n60;
    path.lineTo(-AppNumDouble.n100, size.height);
    path.quadraticBezierTo(
      size.width / AppNumInt.n4,
      highPoint,
      size.width / AppNumInt.n2,
      lowPoint,
    );
    path.quadraticBezierTo(AppNumInt.n3 / AppNumInt.n4 * size.width,
        size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
//==========================================================================================================================

class WaveClipperTwopath extends CustomClipper<Path> {
  bool reverse;
  bool flip;

  WaveClipperTwopath({this.reverse = false, this.flip = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 3, size.height);
    var firstEndPoint = Offset(size.width / 2.15, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint =
        Offset(size.width - (size.width / 3.23), size.height - 100);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//==========================================================================================================================

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - AppSize.s30;
    final highPoint = size.height - AppSize.s60;
    path.lineTo(-AppSize.s100, size.height);
    path.quadraticBezierTo(
      size.width / AppSize.s4,
      highPoint,
      size.width / AppSize.s2,
      lowPoint,
    );
    path.quadraticBezierTo(AppSize.s3 / AppSize.s4 * size.width, size.height,
        size.width, lowPoint - 200);
    path.lineTo(size.width, AppSize.s0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//==========================================================================================================================
class ClipLopginUp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height - 100, size.width * .5, size.height - 50);
    path.quadraticBezierTo(size.width - (size.width / 3), size.height - 20,
        size.width, size.height - 20);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//==========================================================================================================================
class ClipLopginunder extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 3 - 50, size.height * .6 - 80,
        size.width * .6, size.height - 80);
    path.quadraticBezierTo(size.width - (size.width / 6), size.height - 60,
        size.width, size.height * .10);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
