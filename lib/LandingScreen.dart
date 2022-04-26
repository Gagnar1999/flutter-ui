import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_flutter/Sample_Data.dart';
import 'package:ui_flutter/util/Constants.dart';
import 'package:ui_flutter/util/CustomFunctions.dart';
import 'package:ui_flutter/util/widget_function.dart';
import 'package:ui_flutter/widgets/BorderBox.dart';
import 'package:ui_flutter/widgets/OptionButton.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "San Francisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "<\$220,000",
                        "For Sale",
                        "3-4 Beds",
                        ">100 sqft"
                      ].map((e) => ChoiceOption(text: e)).toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealStateItem(itemData: RE_DATA[index]);
                        },
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                width: size.width,
                child: Center(child: OptionButton("Map View", Icons.map, size.width * 0.35)),
                bottom: 20,
              )
            ],
          )),
    ));
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
      margin: const EdgeInsets.only(left: 25),
    );
  }
}

class RealStateItem extends StatelessWidget {
  final dynamic itemData;

  const RealStateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.asset(itemData["image"]),
                borderRadius: BorderRadius.circular(25),
              ),
              Positioned(
                child: BorderBox(
                    height: 50, width: 50, child: Icon(Icons.favorite_border)),
                top: 15,
                right: 15,
              )
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                formatCurrency(itemData["amount"]),
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData["address"]}",
                style: themeData.textTheme.headline6,
              ),
            ],
          ),
          Text(
            "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} area",
            style: themeData.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
