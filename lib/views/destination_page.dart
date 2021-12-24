import 'package:flutter/material.dart';
import 'package:park_it/views/parking_selection.dart';

class DestinationSelection extends StatelessWidget {
  DestinationSelection({Key? key}) : super(key: key);
  final TextEditingController _searchQueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a destination'),
        backgroundColor: const Color(0xFF5D89FA),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(image: AssetImage('assets/map_placeholder.png'), fit: BoxFit.fill),
          
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05,
                    horizontal: size.width * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    hintText: 'search for a destination',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ParkingSelection()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('confirm'),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF5D89FA),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
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
}
