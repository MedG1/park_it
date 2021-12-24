import 'package:flutter/material.dart';

TimeOfDay? timeFromString(String timeStr){
  if(timeStr.isEmpty){
    return null;
  }
  List<String> timeSplit = timeStr.split(':');
  int hour = int.parse(timeSplit[0]);
  int minute = int.parse(timeSplit[1]);
  return TimeOfDay(hour: hour, minute: minute);
}