import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 79, 20, 90),
            borderRadius: BorderRadius.circular(8),
            border: Border.all()),
        child: const Center(
          child: Text(
            "No Vehicle Added",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
