import 'package:flutter/material.dart';
import 'package:vehicles_app/resources/car.dart';
import 'package:vehicles_app/widgets/car_display.dart';

class CarList extends StatelessWidget {
  const CarList({super.key, required this.list, required this.onTap});
  final List<Car> list;
  final void Function(Car car) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map((e) => CarDisplayItem(
                object: e,
                onTap: (e) {
                  onTap(e);
                },
              ))
          .toList(),
    );
  }
}
