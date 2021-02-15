import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final String number = "61234567";
final String email = "dev@ezeats.com";

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
             
              width: 1000,
              height: 100,
              child: Image(image: AssetImage("img/logo.png")),
            ),
            Container(
              child: Text(
                "About Us:",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                child: Text(
                    "We aim to allow you to order food easily,\nand allow you to have the freedom of choice to:\npick it up yourself to save on delivery costs\nor have it delivered to your doorstep")),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Contact Us:",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
             Container(
           margin: const EdgeInsets.only(
                          top: 10.0,bottom: 8),
                child: Text(
                  "Tel: 61234567",
                ),
                
               
            ),
             Container(
           margin: const EdgeInsets.only(
                          top: 10.0,bottom: 20),
                child: Text(
                  "Email: dev@ezeats.com",
                ),
                
               
            ),
            
            Container(
              child: RaisedButton(
                child: Text(
                  "CALL US",
                ),
                onPressed: _makingPhoneCall,
              ),
            ),
            
            Container(
              child: RaisedButton(
                child: Text(
                  "EMAIL US",
                ),
                onPressed: _sendingEmail,
              ),
            ),
          ]),
    );
  }
}

_makingPhoneCall() async {
  const url = 'tel: 61234567';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sendingEmail() async {
  const url = 'mailto: dev@ezeats.com?subject=Re:Feedback';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
