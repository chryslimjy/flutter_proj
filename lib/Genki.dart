// import 'package:flutter/material.dart';
// import 'Delivery.dart';
// import 'Pickup.dart';

// class OrderData{
//     int price;
//     String order;
//     OrderData(this.price, this.order);
//   }
  

// class GenkiSushi extends StatefulWidget {
//   @override
//   _GenkiSushiState createState() => _GenkiSushiState();
// }

// class _GenkiSushiState extends State<GenkiSushi> {
//   bool setA = false;
//   bool setB = false;
//   bool setC = false;
//   int price = 0;
  
//   String finalOrder = "";

//   String orderA = "";
//   String orderB = "";
//   String orderC = "";

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Genki Sushi'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Container(
//               margin: const EdgeInsets.only(top: 10.0),
//               width: 300,
//               height: 80,
//               child: Text(
//                 'Choose your selection',
//                 style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//                 margin: const EdgeInsets.only(
//                     top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       margin: const EdgeInsets.only(
//                           bottom: 10.0, left: 15.0, right: 15.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.baseline, // <--
//                         textBaseline: TextBaseline.alphabetic,
//                         children: <Widget>[
//                           Container(
//                             width: 100,
//                             child: Text(
//                               'Sushi set A',
//                               style: TextStyle(
//                                   fontSize: 15.0, fontWeight: FontWeight.bold),
//                               textDirection: TextDirection.ltr,
//                             ),
//                           ),
//                           Container(
//                             margin:
//                                 const EdgeInsets.only(left: 90.0, right: 20.0),
//                             width: 110,
//                             height: 30,
//                             child: Checkbox(
//                               checkColor: Colors.black,
//                               activeColor: Colors.blue,
//                               value: this.setA,
//                               onChanged: (bool value) {
//                                 setState(() {
//                                   this.setA = value;
//                                   if (value == true) {
//                                     price = price + 15;
//                                     orderA = "Sushi set A";
                                    
//                                   }else{
//                                     price = price - 15;
//                                     orderA = "";
//                                   }
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.baseline, // <--
//                         textBaseline: TextBaseline.alphabetic,
//                         children: <Widget>[
//                           Container(
//                             width: 100,
//                             child: Text(
//                               'Sushi set B',
//                               style: TextStyle(
//                                   fontSize: 15.0, fontWeight: FontWeight.bold),
//                               textDirection: TextDirection.ltr,
//                             ),
//                           ),
//                           Container(
//                             margin:
//                                 const EdgeInsets.only(left: 90.0, right: 20.0),
//                             width: 110,
//                             height: 30,
//                             child: Checkbox(
//                               checkColor: Colors.black,
//                               activeColor: Colors.blue,
//                               value: this.setB,
//                               onChanged: (bool value) {
//                                 setState(() {
//                                   this.setB = value;
//                                    if (value == true) {
//                                     price = price + 25;
//                                      orderB = "Sushi set B";
                                  
//                                   }else{
//                                     price = price - 25;
//                                    orderB = "";
//                                   }
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.baseline, // <--
//                         textBaseline: TextBaseline.alphabetic,
//                         children: <Widget>[
//                           Container(
//                             width: 100,
//                             child: Text(
//                               'Sushi set C',
//                               style: TextStyle(
//                                   fontSize: 15.0, fontWeight: FontWeight.bold),
//                               textDirection: TextDirection.ltr,
//                             ),
//                           ),
//                           Container(
//                             margin:
//                                 const EdgeInsets.only(left: 90.0, right: 20.0),
//                             width: 110,
//                             height: 30,
//                             child: Checkbox(
//                               checkColor: Colors.black,
//                               activeColor: Colors.blue,
//                               value: this.setC,
//                               onChanged: (bool value) {
//                                 setState(() {
//                                   this.setC = value;
//                                    if (value == true) {
//                                     price = price + 10;
//                                     orderC = "Sushi set C";
//                                   }else{
//                                     price = price - 10;
//                                     orderC = "";
//                                   }
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
//                       child: Text("Total price: \$$price"),
//                     ),
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           RaisedButton(
//                               child: Text('Self pickup'),
//                               onPressed: () {
//                               finalOrder = orderA + " " + orderB + " " + orderC;
//                                 OrderData data = new OrderData(price,finalOrder);
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => 
//                                       Pickup(data: data)),
//                                 );
//                               }),
//                           Container(
//                             margin:
//                                 const EdgeInsets.only(left: 15.0, right: 15.0),
//                           ),
//                           RaisedButton(
//                               child: Text('Delivery'),
//                               onPressed: () {
                                
//                                   OrderData data = new OrderData(price, finalOrder);
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => 
//                                       Delivery(data: data)),
//                                 );
//                               }),
//                         ],
//                       ),
//                     ),
                    
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
