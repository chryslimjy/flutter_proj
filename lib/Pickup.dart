import 'package:flutter/material.dart';

import 'OrderSummary.dart';

import 'App.dart';

class OrderDetails {
  int price;
  String pickupTime;
  String order;

  OrderDetails(this.price, this.pickupTime, this.order);
}

class Pickup extends StatefulWidget {
  final OrderData data;

  Pickup({Key key, @required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
//OrderData data _PickupState(this. data);

  String pickupTime = "";

  List<String> _locations = ['12pm', '1pm', '2pm', '3pm']; // Option 2
  String _selectedLocation; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self pickup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Your Order',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(widget.data.order),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Text(
                'pickup time',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                child: DropdownButton(
              hint: Text(
                  'Please choose a pickup time'), // Not necessary for Option 1
              value: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                  pickupTime = newValue;
                });
              },
              items: _locations.map((location) {
                return DropdownMenuItem(
                  child: new Text(location),
                  value: location,
                );
              }).toList(),
            )),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Text('Order Confirmation: \n\n Payment of: \$' +
                  widget.data.price.toString()),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                  child: Text('Make payment'),
                  onPressed: () {
                    OrderDetails details = new OrderDetails(
                        widget.data.price, pickupTime, widget.data.order);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderSummary(data: details)),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
