import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/components/body.dart';

import '../../model/plant_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        plant: plant,
      ),
    );
  }
}
