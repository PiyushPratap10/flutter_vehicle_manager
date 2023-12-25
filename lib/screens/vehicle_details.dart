import 'package:flutter/material.dart';
import 'package:vehicles_app/resources/bike.dart';
import 'package:vehicles_app/resources/car.dart';
import 'package:vehicles_app/resources/dummy_list.dart';
import 'package:vehicles_app/screens/vehicle_form.dart';
import 'package:vehicles_app/widgets/bike_list.dart';
import 'package:vehicles_app/widgets/car_list.dart';
import 'package:vehicles_app/widgets/empty.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({super.key});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int currentIndex;

  late Widget renderList;
  void onTapPressed(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      if (carList.isEmpty) {
        renderList = const EmptyWidget();
      } else {
        renderList = CarList(
          list: carList,
          onTap: removeCar,
        );
      }
    } else {
      if (bikeList.isEmpty) {
        renderList = const EmptyWidget();
      } else {
        renderList = BikeList(
          list: bikeList,
          onTap: removeBike,
        );
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    renderList = BikeList(list: bikeList, onTap: removeBike);
    currentIndex = 0;
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void removeBike(Bike bike) {
    bikeList.removeWhere((element) => element.number == bike.number);
    if (bikeList.isEmpty) {
      renderList = const EmptyWidget();
    } else {
      renderList = BikeList(
        list: bikeList,
        onTap: removeBike,
      );
    }
    setState(() {});
  }

  void removeCar(Car car) {
    carList.removeWhere((element) => element.number == car.number);
    if (carList.isEmpty) {
      renderList = const EmptyWidget();
    } else {
      renderList = CarList(
        list: carList,
        onTap: removeCar,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 49, 12, 56),
        appBar: AppBar(
          title: const Text(
            'Vehicle Details',
            style: TextStyle(color: Color.fromARGB(255, 49, 12, 56)),
          ),
          bottom: TabBar(
              onTap: onTapPressed,
              unselectedLabelColor: const Color.fromARGB(255, 49, 12, 56),
              labelColor: const Color.fromARGB(255, 79, 20, 90),
              controller: _tabController,
              tabs: const [Text('Bike'), Text('Car')]),
          centerTitle: true,
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const VehicleForm()));
            setState(() {});
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * .7,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 79, 20, 90),
                  Color.fromARGB(255, 49, 12, 56),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(10),
                border: Border.all()),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Vehicles",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * .1,
                right: MediaQuery.sizeOf(context).width * .1,
                top: 10),
            child: renderList,
          ),
        ));
  }
}
