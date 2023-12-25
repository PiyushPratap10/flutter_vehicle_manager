import 'package:flutter/material.dart';
import 'package:vehicles_app/resources/bike.dart';
import 'package:vehicles_app/resources/car.dart';
import 'package:vehicles_app/resources/dummy_list.dart';
import 'package:vehicles_app/screens/vehicle_details.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final _formKey = GlobalKey<FormState>();

  List<String> typeList = ['Bike', 'Car'];
  String selectedCategory = 'Bike';

  List<String> fuelList = ['Petrol', 'Diesel'];
  String selectedFuelType = 'Petrol';

  String number = '';
  String brand = '';
  String type = '';
  String fuel = '';
  
  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      if (type == 'Car') {
        carList.add(Car(number: number, brand: brand, type: type, fuel: fuel));
      } else {
        bikeList
            .add(Bike(number: number, brand: brand, type: type, fuel: fuel));
      }
      Navigator.pop(
          context, MaterialPageRoute(builder: (ctx) => const VehicleDetails()));
    } else {
      return;
    }
  }

  void showDropdownMenuType(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DropdownButton(
            value: selectedCategory,
            items: typeList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void showDropdownMenuFuel(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DropdownButton(
            value: selectedFuelType,
            items: fuelList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedFuelType = newValue!;
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 12, 56),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: submit,
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
            child: const Text(
              "SUBMIT",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
      ),
      appBar: AppBar(
        title: const Text(
          'Vehicle Form',
          style: TextStyle(color: Color.fromARGB(255, 49, 12, 56)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: "Vehicle No",
                      labelStyle: TextStyle(color: Colors.white)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Vehicle Number';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    number = newValue!;
                  },
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: "Brand Name",
                      labelStyle: TextStyle(color: Colors.white)),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter brand name' : null,
                  onSaved: (newValue) {
                    brand = newValue!.trim();
                  },
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: "Vehicle Type",
                      labelStyle: TextStyle(color: Colors.white)),
                  readOnly: true,
                  controller: TextEditingController(text: selectedCategory),
                  onTap: () => showDropdownMenuType(context),
                  onSaved: (newValue) {
                    type = newValue!;
                  },
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: "Fuel Type",
                      labelStyle: TextStyle(color: Colors.white)),
                  readOnly: true,
                  controller: TextEditingController(text: selectedFuelType),
                  onTap: () => showDropdownMenuFuel(context),
                  onSaved: (newValue) {
                    fuel = newValue!;
                  },
                ),
              ],
            )),
      ),
    );
  }
}
