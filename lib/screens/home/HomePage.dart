import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/itemmodel.dart';
import 'package:flutter_app/screens/home/Add.dart';

import '../../models/itemmodel.dart';
import '../../models/itemmodel.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<item> itemlist =[
    item("Onion", 200.00, DateTime.now(), "Hyderabad"),
    item("Potato", 175.00, DateTime.now(), "Warangal"),
    item("Tomato", 125.00, DateTime.now(), "Amaravati"),
  ];
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final newItem = new item(null, null, null, null);
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              //Navigate
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Additem(Item: newItem)),
              );
            },
            color: Colors.black,
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.green[200],
        title: Center(
          child: Text(
              "Kissan Konnect",
              style: TextStyle(
                color: Colors.black,
              )
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _key.currentState.openDrawer();
          },
          color: Colors.black,
        ),
        //actions: [
          //IconButton(icon: Icon(Icons.notifications_none),
            //  onPressed: () {},
              //color: Colors.black)
        //],

      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                      color: Colors.green[50],
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: "Search here",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                              "Browse categories",
                              style: TextStyle(
                                  fontSize: 15
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextButton(
                            child: Text('See all'),

                            style: TextButton.styleFrom(

                                primary: Colors.black,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 100.0,
                  child:
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex:5,
                              child: Icon(
                                Icons.fastfood_rounded,

                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  "wheat"
                              ),
                            )
                          ],
                        ),
                        width: 100.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex:5,
                              child: Icon(
                                Icons.fastfood_rounded,

                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  "vegetable"
                              ),
                            )
                          ],
                        ),
                        width: 100.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex:5,
                              child: Icon(
                                Icons.fastfood_rounded,

                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  "fruits"
                              ),
                            )
                          ],
                        ),
                        width: 100.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex:5,
                              child: Icon(
                                Icons.fastfood_rounded,

                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  "poultry"
                              ),
                            )
                          ],
                        ),
                        width: 100.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex:5,
                              child: Icon(
                                Icons.fastfood_rounded,

                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  "fish"
                              ),
                            )
                          ],
                        ),
                        width: 100.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: new ListView.builder(
                      itemCount: itemlist.length,
                      itemBuilder: (BuildContext context, int index) => builditemcard(context, index)
                  ),
                ),
              ]
          )
      ),
    );
  }
  Widget builditemcard (BuildContext context, int index){
    return new Container(
      child: Card(
        child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom: 4.0),
                      child: Row(
                        children: [
                          Text(itemlist[index].name, style: new TextStyle(fontSize: 30.0),),
                          Spacer(),
                          //Image.network('https://www.almanac.com/sites/default/files/styles/primary_image_in_article/public/image_nodes/tomatoes_helios4eos_gettyimages-edit.jpeg?itok=4KrW14a4.jpeg'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:4.0, bottom:80.0),
                      child: Row(
                        children: [
                          Text(DateFormat('dd/MM/yyyy').format(itemlist[index].dateadded).toString()),
                          Spacer(),
                        ],
                      ),
                    ),

                   Padding(
                     padding: const EdgeInsets.only(top:8.0, bottom:8.0),
                     child: Row(
                       children: <Widget>[
                         Text("₹${itemlist[index].price.toString()}"),
                         Spacer(),
                         Text(itemlist[index].location),
                       ],
                     ),
                   ),

                  ]
              ),
            ),

      ),
    );

  }
}
