import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:protofolio/models/header_item.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:protofolio/utils/globals.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

List<GlobalKey> keys;
List<HeaderItem> headerItems = [
  HeaderItem(
    title: "TENTANG SAYA",
    onTap: () {
      Scrollable.ensureVisible(
        intro.currentContext,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
  ),
  HeaderItem(
    title: "MELAYANI",
    onTap: () {
      Scrollable.ensureVisible(
        service.currentContext,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
  ),
  HeaderItem(
    title: "PROTOFOLIO",
    onTap: () {
      Scrollable.ensureVisible(
        protofolio.currentContext,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
  ),
  HeaderItem(
    title: "KEAHLIAN",
    onTap: () {
      Scrollable.ensureVisible(
        skill.currentContext,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
  ),
  HeaderItem(
    title: "KONTAK",
    onTap: () {
      Scrollable.ensureVisible(
        contact.currentContext,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
  ),
];

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.0,
              child: Image.asset("assets/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [Condition.largerThan(name: MOBILE)],
      child: Row(
          children: headerItems
              .map(
                (e) => e.isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColors,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextButton(
                            onPressed: e.onTap,
                            child: Text(
                              e.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: EdgeInsets.only(right: 30.0),
                          child: GestureDetector(
                            onTap: e.onTap,
                            child: Text(
                              e.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
              )
              .toList()),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState.openEndDrawer();
              },
              child: Icon(
                FlutterIcons.menu_fea,
                color: Colors.white,
                size: 28.0,
              ))
        ],
      ),
    ));
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [HeaderLogo(), HeaderRow()],
      ),
    );
  }
}
