import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String parkingName;
  final DateTime transactionDatetime ;
  final double reservationFees;
  final double hourlyFees;
  final TimeOfDay? checkInTime;
  final TimeOfDay? checkOutTime;
  const TransactionCard({Key? key, required this.parkingName,required this.transactionDatetime, required this.reservationFees, required this.hourlyFees, this.checkInTime, this.checkOutTime})
      : super(key: key);

  static const TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    double durationOfStay = getDuration(checkInTime, checkOutTime);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5.0,
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.blue.shade600),
                const SizedBox(width: 5.0),
                Text('${transactionDatetime.day}/${transactionDatetime.month}/${transactionDatetime.year}', style: const TextStyle(color: Colors.grey),),
                const Expanded(child: SizedBox()),
                Text('${checkInTime?.toString() ?? 'didn\'t check-in'} to ${checkOutTime?.toString() ?? 'didn\'t check-out'}' , style: const TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all( 10.0), child: Text(parkingName, style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 18.0))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Duration: ${durationOfStay.truncate()}h${((durationOfStay - durationOfStay.truncate()) * 60).truncate()}min', style: textStyle),
                const SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('fees', style: textStyle,),
                    Text('${reservationFees + durationOfStay.ceil() * hourlyFees}', style: textStyle,),
                  ],
                ),
                const Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('reservation', style: textStyle,),
                    Text('${reservationFees}TND', style: textStyle,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('1st 2h', style: textStyle,),
                    Text('${durationOfStay.ceil() * hourlyFees}TND', style: textStyle,),
                  ],
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  double getDuration(TimeOfDay? start, TimeOfDay? end){
    if(start == null){
      return 0;
    } else if(end == null){
      TimeOfDay now = TimeOfDay.now();
      if(now.hour > start.hour || (now.hour == start.hour && now.minute > start.minute)){
        return hoursFromTime(now) - hoursFromTime(start);
      } else{
        double timeDiff = hoursFromTime(const TimeOfDay(hour: 24, minute: 0)) - hoursFromTime(start);
        timeDiff += hoursFromTime(now);
        return timeDiff;
      }
    } else {
      if(end.hour > start.hour || (end.hour == start.hour && end.minute > start.minute)){
        return hoursFromTime(end) - hoursFromTime(start);
      } else{
        double timeDiff = hoursFromTime(const TimeOfDay(hour: 24, minute: 0)) - hoursFromTime(start);
        timeDiff += hoursFromTime(end);
        return timeDiff;
      }
    }
  }

  double hoursFromTime(TimeOfDay time){
    return time.hour.toDouble() + time.minute.toDouble() / 60;
  }
}
