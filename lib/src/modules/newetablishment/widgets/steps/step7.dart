import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';

Widget step7(BuildContext context) {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles = [];
  return Container(
    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            openImages(imgpicker, imagefiles);
          },
          child: Container(
            width: 160,
            height: 120,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: shadow1,
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    spreadRadius: 0),
                BoxShadow(
                    color: shadow2,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: -2),
                BoxShadow(
                    color: shadow3,
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 0)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset('assets/images/svg/icon-medias.svg'),
                Text(S.of(context).add_picture,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      color: grey2,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
        ),
        buildGridView(imagefiles)
      ],
    ),
  );
}

Widget buildGridView(List<XFile>? imagefiles) {
  return Column(
    children: [
      SizedBox(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(imagefiles!.length, (index) {
            var file = imagefiles[index];
            return Container(
              color: transparent,
              width: 160,
              height: 120,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: shadow1,
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      spreadRadius: 0),
                  BoxShadow(
                      color: shadow2,
                      offset: Offset(0, 3),
                      blurRadius: 3,
                      spreadRadius: -2),
                  BoxShadow(
                      color: shadow3,
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      spreadRadius: 0)
                ],
              ),
              child: Image.file(File(file.path)),
            );
          }),
        ),
      ),
    ],
  );
}

openImages(ImagePicker imgpicker, List<XFile>? imagefiles) async {
  try {
    var pickedfiles = await imgpicker.pickMultiImage();
    //you can use ImageCourse.camera for Camera capture
    if (pickedfiles != null) {
      print("yes image is selected.");
      imagefiles = pickedfiles;
    } else {
      print("No image is selected.");
    }
  } catch (e) {
    print("error while picking file.");
  }
}
