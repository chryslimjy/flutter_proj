import 'package:flutter/material.dart';

import 'Delivery.dart';
import 'Pickup.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text("Welcome"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 200,
              height: 80,
              child: Text(
                'Select a store',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 350,
              child: ListView(children: <Widget>[
                Card(
                  child: ListTile(
                    
                      leading: Image(image: AssetImage("img/genki.png")),
                      title: Text('Genki Sushi'),
                      subtitle: Text('Japanese Cuisine'),
                      trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenkiSushi()),
                          );
                        },
                      )),
                ),
                Card(
                  child: ListTile(
                      leading: Image(image: AssetImage("img/mcdonalds.png")),
                      title: Text('McDonalds'),
                      subtitle: Text('Western Cuisine'),
                      trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => McDonaldsPage()),
                          );
                        },
                      )),
                ),
                Card(
                  child: ListTile(
                    leading:Image(image: AssetImage("img/kfc.png")),
                    title: Text('KFC'),
                    subtitle: Text('Western Cuisine'),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KFC()),
                        );
                      },
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderData {
  int price;
  String order;
  OrderData(this.price, this.order);
}

class GenkiSushi extends StatefulWidget {
  @override
  _GenkiSushiState createState() => _GenkiSushiState();
}

class _GenkiSushiState extends State<GenkiSushi> {
  bool setA = false;
  bool setB = false;
  bool setC = false;
  int price = 0;

  String finalOrder = "";

  String orderA = "";
  String orderB = "";
  String orderC = "";

  int counterA = 1;
  int counterB = 1;
  int counterC = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Genki Sushi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 300,
              height: 80,
              child: Text(
                'Choose your selection',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              width: 350,
              height: 80,
              child: Text(
                'Please set quantity before selecting checkbox',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              height: 600,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
                children: <Widget>[
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Sushi set A (\$15)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/sushi3.jpg")),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterA;
                                        //// counterA * price
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterA')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterA > 1) {
                                          --counterA;
                                          //  price = counterA * 15;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setA,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setA = value;
                                  if (value == true) {
                                    orderA = "Sushi set A x$counterA\n";
                                    price = price + counterA * 15;
                                  } else {
                                    //setAPrice = setAPrice -  15;
                                    orderA = "";
                                    price = price - counterA * 15;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Sushi set B (\$25)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/sushi1.jpg")),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterB;
                                        //// counterA * price
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterB')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterB > 1) {
                                          --counterB;
                                          //  price = counterA * 15;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setB,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setB = value;
                                  if (value == true) {
                                    orderB = "Sushi set B x$counterB\n";
                                    price = price + counterB * 25;
                                  } else {
                                    //setAPrice = setAPrice -  15;
                                    orderB = "";
                                    price = price - counterB * 25;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Sushi set C (\$10)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/sushi2.jpg")),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterC;
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterC')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterC > 1) {
                                          --counterC;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setC,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setC = value;
                                  if (value == true) {
                                    orderC = "Sushi set C x$counterC\n";
                                    price = price + counterC * 10;
                                  } else {
                                    //setAPrice = setAPrice -  15;
                                    orderC = "";
                                    price = price - counterC * 10;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text("Total price: \$$price"),
                          Container(margin: const EdgeInsets.only(top: 10)),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 55.0, right: 15.0),
                              ),
                              RaisedButton(
                                  child: Text('Self pickup'),
                                  onPressed: () {
                                    finalOrder =
                                        orderA + " " + orderB + " " + orderC;
                                    OrderData data =
                                        new OrderData(price, finalOrder);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Pickup(data: data)),
                                    );
                                  }),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                              ),
                              RaisedButton(
                                  child: Text('Delivery'),
                                  onPressed: () {
                                    finalOrder =
                                        orderA + " " + orderB + " " + orderC;
                                    OrderData data =
                                        new OrderData(price, finalOrder);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Delivery(data: data)),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KFC extends StatefulWidget {
  @override
  _KFCState createState() => _KFCState();
}

class _KFCState extends State<KFC> {
  bool setA = false;
  bool setB = false;
  bool setC = false;
  int price = 0;

  String finalOrder = "";

  String orderA = "";
  String orderB = "";
  String orderC = "";

  int counterA = 1;
  int counterB = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KFC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 300,
              height: 80,
              child: Text(
                'Choose your selection',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              width: 350,
              height: 80,
              child: Text(
                'Please set quantity before selecting checkbox',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              height: 600,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
                children: <Widget>[
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Fried Chicken set A (\$18)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/KFC_A.png"),height: 310),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterA;
                                        //// counterA * price
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterA')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterA > 1) {
                                          --counterA;
                                          //  price = counterA * 15;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setA,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setA = value;
                                  if (value == true) {
                                    orderA = "Fried Chicken Set A x$counterA\n";
                                    price = price + counterA * 18;
                                  } else {
                                    orderA = "";
                                    price = price - counterA * 18;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Fried Chicken Set B (\$25)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/KFC_B.png")),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterB;
                                        //// counterA * price
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterB')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterB > 1) {
                                          --counterB;
                                          //  price = counterA * 15;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setB,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setB = value;
                                  if (value == true) {
                                    orderB = "Fried Chicken Set B x$counterB\n";
                                    price = price + counterB * 25;
                                  } else {
                                    //setAPrice = setAPrice -  15;
                                    orderB = "";
                                    price = price - counterB * 25;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text("Total price: \$$price"),
                          Container(margin: const EdgeInsets.only(top: 10)),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 55.0, right: 15.0),
                              ),
                              RaisedButton(
                                  child: Text('Self pickup'),
                                  onPressed: () {
                                    finalOrder =
                                        orderA + " " + orderB + " " + orderC;
                                    OrderData data =
                                        new OrderData(price, finalOrder);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Pickup(data: data)),
                                    );
                                  }),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                              ),
                              RaisedButton(
                                  child: Text('Delivery'),
                                  onPressed: () {
                                    finalOrder =
                                        orderA + " " + orderB + " " + orderC;
                                    OrderData data =
                                        new OrderData(price, finalOrder);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Delivery(data: data)),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class McDonaldsPage extends StatefulWidget {
  @override
  _McDonaldsState createState() => _McDonaldsState();
}

class _McDonaldsState extends State<McDonaldsPage> {
  bool setA = false;
  bool setB = false;
  bool setC = false;
  int price = 0;

  String finalOrder = "";

  String orderA = "";
  String orderB = "";
  String orderC = "";

  int counterA = 1;
  int counterB = 1;
  int counterC = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('McDonalds'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 300,
              height: 80,
              child: Text(
                'Choose your selection',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              width: 350,
              height: 80,
              child: Text(
                'Please set quantity before selecting checkbox',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              height: 680,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
                children: <Widget>[
                  Container(
               
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "McChicken Set (\$5)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/mcchicken.jpg"),height: 300),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterA;
                                        //// counterA * price
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterA')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterA > 1) {
                                          --counterA;
                                          //  price = counterA * 15;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setA,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setA = value;
                                  if (value == true) {
                                    orderA = "McChicken set x$counterA\n";
                                    price = price + counterA * 5;
                                  } else {
                                    //setAPrice = setAPrice -  15;
                                    orderA = "";
                                    price = price - counterA * 5;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Party Set A (\$12)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/partyA.png"),height: 300),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterB;
                                        //// counterA * price
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterB')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterB > 1) {
                                          --counterB;
                                          //  price = counterA * 15;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setB,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setB = value;
                                  if (value == true) {
                                    orderB = "Party Set A x$counterB\n";
                                    price = price + counterB * 12;
                                  } else {
                                
                                    orderB = "";
                                    price = price - counterB * 12;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    color: Colors.indigo[100],
                    padding: const EdgeInsets.all(18),
                    child: Column(children: <Widget>[
                      Text(
                        "Party Set B(\$18)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Image(image: AssetImage("img/partyB.png"),height: 300),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 24.0, right: 20.0, top: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text("Quantity: "),
                                  ),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.add_circle),
                                    onTap: () {
                                      setState(() {
                                        ++counterC;
                                      });
                                    },
                                  )),
                                  Container(child: Text('$counterC')),
                                  Container(
                                      child: GestureDetector(
                                    child: Icon(Icons.remove_circle),
                                    onTap: () {
                                      setState(() {
                                        if (counterC > 1) {
                                          --counterC;
                                        }
                                      });
                                    },
                                  )),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 20.0, top: 15),
                            width: 110,
                            height: 30,
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.blue,
                              value: this.setC,
                              onChanged: (bool value) {
                                setState(() {
                                  this.setC = value;
                                  if (value == true) {
                                    orderC = "Party Set B x$counterC\n";
                                    price = price + counterC * 18;
                                  } else {
                                    //setAPrice = setAPrice -  15;
                                    orderC = "";
                                    price = price - counterC * 18;
                                  }
                                });
                              },
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text("Total price: \$$price"),
                          Container(margin: const EdgeInsets.only(top: 10)),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 55.0, right: 15.0),
                              ),
                              RaisedButton(
                                  child: Text('Self pickup'),
                                  onPressed: () {
                                    finalOrder =
                                        orderA + " " + orderB + " " + orderC;
                                    OrderData data =
                                        new OrderData(price, finalOrder);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Pickup(data: data)),
                                    );
                                  }),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                              ),
                              RaisedButton(
                                  child: Text('Delivery'),
                                  onPressed: () {
                                    finalOrder =
                                        orderA + " " + orderB + " " + orderC;
                                    OrderData data =
                                        new OrderData(price, finalOrder);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Delivery(data: data)),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


