import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/region_card.dart';

class RegionsPage extends StatefulWidget {
  final Widget drawer;
  const RegionsPage({Key? key, required this.drawer}) : super(key: key);

  @override
  State<RegionsPage> createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {
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
      drawer: widget.drawer,
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('regions').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }
             List<QueryDocumentSnapshot> regionDocuments = snapshot.data!.docs;
            return ListView.separated(
              itemCount: regionDocuments.length,
              separatorBuilder: (context, inedx) => const SizedBox(height: 10.0),
              itemBuilder: (context, index) {
                final data = regionDocuments[index].data()! as Map<String, dynamic>;
                return RegionCard(regionName: '${index + 1}. ${data['name']}', parkingCount: data['parkingCount'], totalSpots: data['totalSpots']);
              }

                  
            );
          }
        ),
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
