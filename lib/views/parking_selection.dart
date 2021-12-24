import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_it/components/selection_card.dart';
import 'package:park_it/views/login_page.dart';
import '../components/region_card.dart';

class ParkingSelection extends StatefulWidget {
  const ParkingSelection({Key? key}) : super(key: key);

  @override
  State<ParkingSelection> createState() => _ParkingSelectionState();
}

class _ParkingSelectionState extends State<ParkingSelection> {
  final TextEditingController _searchQueryController = TextEditingController();

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D89FA),
        title: _buildSearchBar(),
        leading: _isSearching
            ? BackButton(
                color: Colors.white,
                onPressed: toggleSearchBarVisibility,
              )
            : null,
      ),
      
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('parkings').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              List<QueryDocumentSnapshot> parkingDocuments = snapshot.data!.docs;
              return ListView.separated(
                  itemCount: parkingDocuments.length,
                  separatorBuilder: (context, inedx) =>
                      const SizedBox(height: 10.0),
                  itemBuilder: (context, index) {
                    final data =
                        parkingDocuments[index].data()! as Map<String, dynamic>;
                    return ParkingCard(
                        name: '${index + 1}. ${data['name']}',
                        emptySpots: int.parse(data['freeSpots']), distance: '10m',);
                  });
            }),
      ),
    );
  }

  Widget _buildSearchBar() => TextField(
        textInputAction: TextInputAction.search,
        controller: _searchQueryController,
        autofocus: false,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 16.0),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search regions...',
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: IconButton(
                onPressed: _searchQueryController.clear,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ))),
      );

  void toggleSearchBarVisibility() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }
}
