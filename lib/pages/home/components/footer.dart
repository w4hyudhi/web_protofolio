import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/models/footer_item.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/mappin.png",
    title: "ALAMAT",
    text1: "Merauke Kec. Merauke Kabupaten Merauke Papua Indonesai",
    text2: "",
  ),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "TELEPON",
    text1: "+6282248245635",
    text2: "",
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "mahfudwahyudi.k@gmail.com",
    text2: "",
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "+6282248245635",
    text2: "",
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: contact,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        children: [
          Text(
            "KONTAK",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: footerItems
                          .map(
                            (footerItem) => Container(
                              height: 150.0,
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          footerItem.iconPath,
                                          width: 25.0,
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(
                                          footerItem.title,
                                          style: GoogleFonts.oswald(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${footerItem.text1}\n",
                                            style: TextStyle(
                                              color: kCaptionColors,
                                              height: 1.8,
                                            ),
                                          ),
                                          // TextSpan(
                                          //   text: "${footerItem.text2}\n",
                                          //   style: TextStyle(
                                          //     color: kCaptionColors,
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Flex(
                    direction: ScreenHelper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    mainAxisAlignment: ScreenHelper.isMobile(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Copyright (c) 2021 MAHFUD WAHYUDI | FLUTTER",
                          style: TextStyle(
                            color: kCaptionColors,
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: MouseRegion(
                      //         cursor: SystemMouseCursors.click,
                      //         child: Text(
                      //           "Privacy Policy",
                      //           style: TextStyle(
                      //             color: kCaptionColors,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0),
                      //       child: Text(
                      //         "|",
                      //         style: TextStyle(
                      //           color: kCaptionColors,
                      //         ),
                      //       ),
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: MouseRegion(
                      //         cursor: SystemMouseCursors.click,
                      //         child: Text(
                      //           "Terms & Conditions",
                      //           style: TextStyle(
                      //             color: kCaptionColors,
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    ),
  );
}
