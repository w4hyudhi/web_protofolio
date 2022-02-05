import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Fotter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Get in touch",
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
                "For business inquiry please send email to mahfudwahyudi.k@gmail.com",
                style: GoogleFonts.roboto(
                  color: kCaptionColors,
                  fontSize: 16,
                  height: 2.0,
                )),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Icon(
                        MaterialCommunityIcons.instagram,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Icon(
                        MaterialCommunityIcons.youtube,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Icon(
                        MaterialCommunityIcons.google_play,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
