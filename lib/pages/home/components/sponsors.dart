import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<String> sponsorsLogo = [
  "assets/as.png",
  "assets/vsc.png",
  "assets/firebase.png",
  "assets/arduino.png",
  "assets/post.png",
  "assets/laravel.png",
  "assets/flutter.png",
  "assets/mysql.png",
  "assets/netbeans.png",
  // "assets/brand2.png",
  // "assets/brand3.png",
  // "assets/brand4.png",
  // "assets/brand5.png",
];

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: tools,
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: ResponsiveWrapper(
      minWidth: width,
      maxWidth: width,
      defaultScale: false,
      child: Column(
        children: [
          Text(
            "ALAT",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Wrap(
                runSpacing: 50.0,
                spacing: 50.0,
                children: sponsorsLogo
                    .map(
                      (logo) => Container(
                        height: 70.0,
                        child: Image.asset(logo),
                        constraints: BoxConstraints(
                          // max of 3 per row when on mobile and 5 per row on bigger screens
                          maxWidth: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 3.0 - 50.0
                              : constraints.maxWidth / 5.0 - 50.0,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    ),
  );
}
