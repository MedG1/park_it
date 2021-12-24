import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_it/views/destination_page.dart';

class HomePage extends StatelessWidget {
  final Widget? drawer;
  const HomePage({Key? key, required this.drawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'),
      backgroundColor: const Color(0xFF5D89FA),
        actions: [
          IconButton(icon: const Icon(Icons.person_rounded), onPressed: (){}),
          IconButton(icon: const Icon(Icons.settings), onPressed: (){}),
        ],
      ),
      drawer: drawer,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.1, bottom: size.width * 0.05),
                child: const Text(
                  'Going somewhere?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationSelection()));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFCAC19)),
                  elevation: MaterialStateProperty.all<double>(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1, vertical: size.height * 0.03),
                  child: const Text(
                    'Find suitable parkings',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    bottom: size.height * 0.04),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.05, bottom: size.height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'destination',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'Parking',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text('Autonomously check in & out using QR codes'),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                semanticContainer: false,
                elevation: 5.0,
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 2.0),
                      height: size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Check-in QR code',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('Check-out QR code',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1.0, indent: 30.0, endIndent: 30.0),
                    SizedBox(
                      height: size.height * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.qr_code_2, size: size.width * 0.15),
                          const VerticalDivider(thickness: 1.0, endIndent: 5.0),
                          Icon(Icons.qr_code_2, size: size.width * 0.15),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
