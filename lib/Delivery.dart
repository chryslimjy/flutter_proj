import 'package:flutter/material.dart';
import 'package:flutter_project/OrderSummaryDeli.dart';
import 'App.dart';
//import 'KFC.dart';



class OrderDetailsDeli{
int price;
String order;

OrderDetailsDeli(this.price, this.order);

}

class Delivery extends StatelessWidget {
  OrderData data;

 // String pickupTime = "Not applicable";

  Delivery({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
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
              child: Text(data.order),
            ),
            Container(
              child: Text('Order Confirmation: \n\n Payment of: \$' +
                  data.price.toString()),
            ),
            Container(
                child: Text('Delivery Fee:  \$5'),
            ),
             
            Container(
              child: RaisedButton(
                  child: Text('Make payment'),
                  onPressed: () {
                    OrderDetailsDeli details = new OrderDetailsDeli(data.price+5,data.order);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderSummaryDeli(data: details)),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
