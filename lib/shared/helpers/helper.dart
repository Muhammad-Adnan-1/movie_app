
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Helper{
  static printValue(Object? value){
    if(kDebugMode){
      print(value);
    }
  }
}

extension StringDateFormat on String{
  String toFormattedDateString(){
    if(isEmpty) return "";
    DateTime dateTime = DateTime.parse(this);
    return dateTime.toFormatDate();
  }
}

extension AppDateFormator on DateTime{
  String toFormatDate(){
    return DateFormat("MMM dd, yyyy").format(this);
  }
}
