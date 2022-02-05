import 'package:flutter/material.dart';

const Color kPrimaryColors = Color.fromRGBO(47, 168, 255, 1.0);
const Color kBackgroundColors = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColors = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColors = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
final intro = new GlobalKey();
final service = new GlobalKey();
final protofolio = new GlobalKey();
final skill = new GlobalKey();
final tools = new GlobalKey();
final contact = new GlobalKey();
ScrollController _scrollController = ScrollController();
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
