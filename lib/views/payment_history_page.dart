import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:park_it/components/transaction_card.dart';
import 'package:park_it/services/utilities.dart';

class PaymentHistory extends StatefulWidget {
  final Widget drawer;
  const PaymentHistory({Key? key, required this.drawer}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
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
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('transactions')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            List<QueryDocumentSnapshot> transactionDocuments =
                snapshot.data!.docs;
            return ListView.separated(
              itemCount: transactionDocuments.length,
              separatorBuilder: (context, inedx) =>
                  const SizedBox(height: 10.0),
              itemBuilder: (context, index) {
                final data =
                    transactionDocuments[index].data()! as Map<String, dynamic>;
                return TransactionCard(
                  parkingName: data['parkingName'],
                  transactionDatetime: DateTime.parse(data['transactionDateTime']),
                  reservationFees: double.parse(data['reservationFees']),
                  hourlyFees: double.parse(data['hourlyFees']),
                  checkInTime: timeFromString(data['checkInTime']),
                  checkOutTime: timeFromString(data['checkOutTime']),
                );
              },
            );
          },
        ),
      ),
    );
  }

  //TODO: add search functionality
  Widget _buildSearchBar() => TextField(
        textInputAction: TextInputAction.search,
        controller: _searchQueryController,
        autofocus: false,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 16.0),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search transaction history...',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: IconButton(
            onPressed: _searchQueryController.clear,
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ),
      );

  void toggleSearchBarVisibility() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }
}
