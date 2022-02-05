import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class WebsiteAd extends StatelessWidget {
  // We can use same idea as ios_app_ad.dart and swap children order, let's copy code
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
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ANDROID APP",
                          style: GoogleFonts.oswald(
                            color: kPrimaryColors,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "GIS TANAMAN OBAT",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Aplikasi yang berisi informasi tanaman - tanaman obat yang disertai dengan informasi khasiat , cara penggunaan, gambar tanaman dan lokasi keberadaan tanaman di area tersebut",
                          style: TextStyle(
                            color: kCaptionColors,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColors,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                height: 48.0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    html.window.open(
                                        'https://www.instagram.com/p/CVM70YypCLr/?utm_source=ig_web_copy_link',
                                        'Tanaman Obat');
                                  },
                                  child: Center(
                                    child: Text(
                                      "Lihat",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10.0,
                            // ),
                            // MouseRegion(
                            //   cursor: SystemMouseCursors.click,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8.0),
                            //       border: Border.all(
                            //         color: kPrimaryColors,
                            //       ),
                            //     ),
                            //     height: 48.0,
                            //     padding: EdgeInsets.symmetric(horizontal: 28.0),
                            //     child: TextButton(
                            //       onPressed: () {},
                            //       child: Center(
                            //         child: Text(
                            //           "NEXT APP",
                            //           style: TextStyle(
                            //             color: kPrimaryColors,
                            //             fontSize: 13.0,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 70.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Image.asset(
                      "assets/mobile2.png",
                      // Set width for image on smaller screen
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
