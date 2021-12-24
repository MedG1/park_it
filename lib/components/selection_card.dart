import 'package:flutter/material.dart';
import 'package:park_it/views/parking_spot_reservation.dart';

class ParkingCard extends StatelessWidget {
  final String name;
  final String distance;
  final int emptySpots;
  const ParkingCard(
      {Key? key,
      required this.name,
        required this.distance,
        this.emptySpots = 0,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SpotReservation()));
          },
          leading: const Icon(Icons.location_on, color: Color(0xFF5D89FA)),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('distance from your destination: 100 m'), // this is a place holder
              Text('parking spots: $emptySpots'),
            ],
          ),
        ),
      ),
    );
  }
}
