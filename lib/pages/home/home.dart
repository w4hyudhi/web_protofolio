import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:protofolio/pages/home/components/carousel.dart';
import 'package:protofolio/pages/home/components/cv_section.dart';
import 'package:protofolio/pages/home/components/education_section.dart';
import 'package:protofolio/pages/home/components/footer.dart';
import 'package:protofolio/pages/home/components/header.dart';
import 'package:protofolio/pages/home/components/ios_app_ad.dart';
import 'package:protofolio/pages/home/components/movie.dart';
import 'package:protofolio/pages/home/components/protofolio_stats.dart';
import 'package:protofolio/pages/home/components/skill_section.dart';
import 'package:protofolio/pages/home/components/sponsors.dart';
import 'package:protofolio/pages/home/components/tps.dart';
import 'package:protofolio/pages/home/components/website_ad.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/globals.dart';

class Home extends StatelessWidget {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColors,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: (headerItems[index].onTap),
                        onTapUp: (details) {
                          Globals.scaffoldKey.currentState.openDrawer();
                        },
                        // onTap: () {
                        //   headerItems[index].onTap;
                        //   Navigator.of(cflutter chaneklontext).pop();
                        // },
                        child: ListTile(
                          title: Text(
                            headerItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Header(),
            ),
            Expanded(
              child: Container(
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Carousel(),
                        SizedBox(
                          height: 20.0,
                        ),
                        CvSection(),
                        IosAppAd(),

                        SizedBox(
                          height: 70.0,
                        ),
                        WebsiteAd(),
                        SizedBox(
                          height: 70.0,
                        ),
                        Movie(),
                        SizedBox(
                          height: 70.0,
                        ),
                        Tps(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          child: ProtofolioStats(),
                        ),
                        EducationSection(),
                        SizedBox(
                          height: 50.0,
                        ),
                        SkillSection(),
                        SizedBox(
                          height: 50.0,
                        ),
                        Sponsors(),
                        SizedBox(
                          height: 50.0,
                        ),
                        // TestimonialWidget(),
                        Footer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
