import 'package:flutter/material.dart';

class OccupiedSpotCard extends StatelessWidget {
  final int parkNumber;
  const OccupiedSpotCard({Key? key,
    required this.parkNumber,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5,
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: Text('P$parkNumber',
                    style:const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold,
                    )),
                style: TextButton.styleFrom(
                  fixedSize: const Size(400, 400),
                  backgroundColor: Colors.redAccent,
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),

                ),
                onPressed: () {
                  /* ... */
                },
              ),

            ],
          ),

        ],
      ),
    );
  }
}