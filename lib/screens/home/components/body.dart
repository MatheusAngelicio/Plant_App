import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/recomend_plants.dart';
import 'package:plant_app/screens/home/components/title_with_more_btn.dart';
import 'featured_plants.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturesPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
