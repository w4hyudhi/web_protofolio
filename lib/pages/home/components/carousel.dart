import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:protofolio/pages/home/components/carousel_items.dart';
import 'package:protofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Carousel extends StatelessWidget {
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .95 : 1);
    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      // color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items: List.generate(
                  5,
                  (index) => Builder(
                        builder: (BuildContext context) {
                          return Container(
                            constraints: BoxConstraints(
                                minHeight: carouselContainerHeight),
                            child: ScreenHelper(
                              desktop: _buildDesktop(
                                  context,
                                  carouselItem[index].text,
                                  carouselItem[index].image),
                              tablet: _buildTablet(
                                  context,
                                  carouselItem[index].text,
                                  carouselItem[index].image),
                              mobile: _buildMobile(
                                  context,
                                  carouselItem[index].text,
                                  carouselItem[index].image),
                            ),
                          );
                        },
                      )).toList(),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(child: image),
        ],
      ),
    ),
  );
}

Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 760.0,
      minWidth: 760.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(child: image),
        ],
      ),
    ),
  );
}

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * .8,
    ),
    width: double.infinity,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            child: image,
          ),
          SizedBox(
            height: 20,
          ),
          text,
        ],
      ),
    ),
  );
}
