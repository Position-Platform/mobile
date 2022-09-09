import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:position/src/core/utils/colors.dart';

Widget loading() {
  return const Center(
    child: SpinKitPulse(
      color: primaryColor,
      size: 60.0,
    ),
  );
}
