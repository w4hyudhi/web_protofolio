import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/models/design_process.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_grid.dart';

final List<DesignProcess> designProcess = [
  DesignProcess(
    title: "MOBILE",
    imagePath: "assets/smartphone.png",
    subtitle: "Mobile native java dan Mobile hybrid menggunakan SDK flutter",
  ),
  DesignProcess(
    title: "WEBSITE",
    imagePath: "assets/world.png",
    subtitle: "Website menggunakan framework laravel",
  ),
  DesignProcess(
    title: "DESKTOP",
    imagePath: "assets/computer.png",
    subtitle: "Platform dekstop menggunakan Netbeans, Borland dan Visual Studo",
  ),
  DesignProcess(
    title: "IOT",
    imagePath: "assets/iot.png",
    subtitle:
        "Perangkat cerdas, monitoring dan robotik menggunakan arduino dan esp8266",
  ),
];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: service,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, 1000.0),
        tablet: _buildUi(context, 760.0),
        mobile: _buildUi(context, MediaQuery.of(context).size.width * .8),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   "BETTER DESIGN,\nBETTER EXPERIENCES",
                //   style: GoogleFonts.oswald(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w900,
                //       fontSize: 18.0,
                //       height: 1.8),
                // ),
                GestureDetector(
                  onTap: () {
                    html.window.open(
                        'https://drive.google.com/file/d/151EIvkcHe02QzNXFq-J49i57ttp7Hda4/view?usp=sharing',
                        'cv mahfud.pdf');
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: GoogleFonts.oswald(
                          color: kPrimaryColors,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              child: LayoutBuilder(
                builder: (_context, constraints) {
                  return ResponsiveGridView.builder(
                    padding: EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    alignment: Alignment.topCenter,
                    gridDelegate: ResponsiveGridDelegate(
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                              ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 2.0
                          : 250.0,
                      childAspectRatio: ScreenHelper.isDesktop(context)
                          ? 1
                          : MediaQuery.of(context).size.aspectRatio * 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  designProcess[index].imagePath,
                                  width: 40.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  designProcess[index].title,
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              designProcess[index].subtitle,
                              style: TextStyle(
                                color: kCaptionColors,
                                height: 1.5,
                                fontSize: 14.0,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: designProcess.length,
                  );
                },
              ),
            )
          ],
        ));
  }
}
