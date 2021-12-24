import 'dart:ffi';

import 'package:flutter/material.dart';

class RegionCard extends StatelessWidget {
  final String regionName;
  final String parkingCount;
  final String totalSpots;
  const RegionCard(
      {Key? key,
      required this.regionName,
      this.parkingCount = '0',
      this.totalSpots = '0'})
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
          onTap: (){},
          leading: const Icon(Icons.location_on, color: Color(0xFF5D89FA)),
          title: Text(regionName, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('parkings(registered): $parkingCount'),
              Text('parking spots: $totalSpots'),
            ],
          ),
        ),
      ),
    );
  }
}
