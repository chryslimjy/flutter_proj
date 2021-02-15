import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:400,
              height:550,
                margin: const EdgeInsets.only(
                    top: 20.0,left: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline, // <--
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      
                       Container(
                            margin:
                                const EdgeInsets.only(right: 20.0),
                            width: 110,
                            height: 30,
                            child: RaisedButton(
                                child: Text('Self-pickup'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Order()),
                                  );
                                }),
                          ),
                       Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            width: 110,
                            height: 30,
                            child: RaisedButton(
                                child: Text('Delivery'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Order()),
                                  );
                                }),
                          ),
                    ])),
                   
          ],
        ),
      ),
    );
  }
}
