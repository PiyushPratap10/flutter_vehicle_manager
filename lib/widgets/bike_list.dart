import 'package:flutter/material.dart';
import 'package:vehicles_app/resources/bike.dart';
import 'package:vehicles_app/widgets/bike_display.dart';

class BikeList extends StatelessWidget {
  const BikeList({super.key, required this.list, required this.onTap});
  final List<Bike> list;
  final void Function(Bike bike) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map((e) => BikeDisplayItem(
                object: e,
                onTap: (e) {
                  onTap(e);
                },
              ))
          .toList(),
    );
  }
}
