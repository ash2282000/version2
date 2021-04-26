import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/itemmodel.dart';


class Additem extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final item Item;
  Additem({Key key, @required this.Item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _namecontroller = new TextEditingController();
    TextEditingController _locationcontroller = new TextEditingController();
    TextEditingController _pricecontroller = new TextEditingController();
    _namecontroller.text = Item.name;
    _locationcontroller.text = Item.location;
    _pricecontroller.text = Item.price as String;

    return Scaffold(
        appBar: AppBar(
          title: Text("Add"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enter item"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _namecontroller ,
                  autofocus: true,
                ),
              ),
              Text("Enter price"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _pricecontroller ,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Text("Enter location"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _locationcontroller ,
                  autofocus: true,
                ),
              ),
              Text("Enter date of harvest/produce"),

              //dateinput
              ElevatedButton(
                child: Text("Add"),
                onPressed: () async {
                   Item.name = _namecontroller.text;
                   Item.price = _pricecontroller.text as double;
                   Item.dateadded = DateTime.now();
                   Item.location = _locationcontroller.text;

                   await db.collection("items").add(
                       {'name': Item.name,
                         'price': Item.price,
                         'Date of Harvest/Produce': Item.dateadded,
                         'Location': Item.location,
                       }

                   );
                   Navigator.of(context).popUntil((route) => route.isFirst);

                },

              )
            ],
          ),
        )

    );
  }
}

