import 'package:flutter/material.dart';
import 'package:flutter_project/Homepage.dart';
import 'Pickup.dart';
//import 'Delivery.dart';

class OrderSummary extends StatelessWidget {
  final OrderDetails data;
 // final OrderDetailsDeli dataDeli;
  OrderSummary({Key key, @required this.data}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
               margin: const EdgeInsets.only(top: 20.0, left: 170),
                child: Row(children: <Widget>[
              Text(
                "Your order:  ",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
             
            ])),
            Container(
               margin: const EdgeInsets.only(bottom: 30),
               child:Text(
               data.order.toString(),
               
                textDirection: TextDirection.ltr,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, left: 140),
                child: Row(children: <Widget>[
              Text(
                "Order Price:  ",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
              Text(
                "\$" + data.price.toString(),
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
            ])),

             Container(
               margin: const EdgeInsets.only(top: 20.0, left: 140, bottom: 20),
                child: Row(children: <Widget>[
              Text(
                "Pickup Time:  ",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
              Text(
                data.pickupTime,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
            ])),
            Container(
              child: RaisedButton(
                  child: Text('Back to Homepage'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  }),
            ),
          
          ],
        ),
      ),
    );
  }
}
