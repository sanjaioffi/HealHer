import 'package:flutter/material.dart';

import '../../../../common/screen_utils/screen_size.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Container(
          height: screenHeight(250),
          width: screenWidth(250),
          color: Colors.red,
        ),
      ),
    );
  }
}
