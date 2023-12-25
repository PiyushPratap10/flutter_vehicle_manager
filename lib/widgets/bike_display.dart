import 'package:flutter/material.dart';
import 'package:vehicles_app/resources/bike.dart';

class BikeDisplayItem extends StatefulWidget {
  const BikeDisplayItem({super.key, required this.object, required this.onTap});
  final Bike object;
  final void Function(Bike bike) onTap;

  @override
  State<BikeDisplayItem> createState() => _BikeDisplayItemState();
}

class _BikeDisplayItemState extends State<BikeDisplayItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 79, 20, 90),
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Vehicle No - ${widget.object.number}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Brand Name - ${widget.object.brand}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Vehicle Type - ${widget.object.type}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Fuel Type - ${widget.object.fuel}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              onPressed: () {
                widget.onTap(widget.object);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
