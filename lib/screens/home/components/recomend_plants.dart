import 'package:flutter/material.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/screens/details/components/body.dart';

import '../../../constants.dart';
import '../../details/details_screen.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Plant> plants = [
      Plant(
        title: "Samantha",
        country: "Russia",
        price: 400,
        image: "assets/images/image_1.png",
      ),
      Plant(
        title: "Angelica",
        country: "Russia",
        price: 470,
        image: "assets/images/image_2.png",
      ),
      Plant(
        title: "Violet",
        country: "Russia",
        price: 730,
        image: "assets/images/image_3.png",
      ),
    ];
    return Container(
      height: 310,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var plant in plants)
            _itemView(
              image: plant.image,
              title: plant.title,
              country: plant.country,
              price: plant.price,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      plant: plant,
                    ),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}

_itemView({
  required String image,
  required String title,
  required String country,
  required int price,
  required Function press,
}) {
  return RecomendPlantCard(
    image: image,
    title: title,
    country: country,
    price: price,
    press: press,
  );
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    super.key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  });

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: () {
              press();
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
