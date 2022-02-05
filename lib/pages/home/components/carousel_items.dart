import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/models/carousel_item_model.dart';
import 'package:protofolio/utils/constans.dart';

List<CarouselItemModel> carouselItem = List.generate(
    1,
    (index) => CarouselItemModel(
        text: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Mahfud Wahyudi",
                style: GoogleFonts.kanit(
                  color: kPrimaryColors,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // \nMobile, Web, Desktop & IOT
              Text("FullStack Developer",
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 46.0,
                    height: 1.3,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "Saya adalah seorang developer dari kota Merauke, lulusan sarjana S1 jurusa Sistem informasi dari universitas Musamus Merauke, memiliki minat di dunia teknlogi terutama bidang pemograman. Mempunyai pengalaman dari tahun 2017 membangun Software untuk perangkat mobile, web, desktop dan perangkat IOT",
                  style: GoogleFonts.roboto(
                    color: kCaptionColors,
                    fontSize: 16,
                    height: 2.0,
                  )),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // MouseRegion(
                    //   cursor: SystemMouseCursors.click,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: kPrimaryColors,
                    //       borderRadius: BorderRadius.circular(8.0),
                    //     ),
                    //     height: 48.0,
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: 28.0,
                    //     ),
                    //     child: TextButton(
                    //       onPressed: () {
                    //         html.window.open(
                    //             'mailto:mahfudwahyudi.k@gmail.com', 'email');
                    //       },
                    //       child: Text(
                    //         "Email Me",
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 13.0,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        html.window
                            .open('mailto:mahfudwahyudi.k@gmail.com', 'email');
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          MaterialCommunityIcons.email,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        html.window.open(
                            'https://www.linkedin.com/in/mahfud-wahyudi-kurniawan-272982121',
                            'email');
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          MaterialCommunityIcons.linkedin,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        html.window.open(
                            'https://www.instagram.com/mahfud_wahyudi_k',
                            'INSTAGRAM');
                      },
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
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        html.window.open('https://wa.me/6282248245635', 'WA');
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          MaterialCommunityIcons.whatsapp,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        html.window.open(
                            'https://play.google.com/store/apps/dev?id=6106727721911320626',
                            'PLAYSTORE');
                      },
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
            ],
          ),
        ),
        image: Container(
          margin: EdgeInsets.only(left: 50),
          // decoration: BoxDecoration(color: Colors.grey[800]),
          child: Stack(
            children: [
              Image.asset(
                "assets/newperson.png",
                fit: BoxFit.contain,
              ),
            ],
          ),
        )));
