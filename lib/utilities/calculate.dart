import 'package:hive/hive.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../models/money.dart';

Box<Money> hiveBox = Hive.box('moneyBox');

String day = Jalali.now().day.toString().length == 2
    ? Jalali.now().day.toString()
    : '0${Jalali.now().day.toString()}';

//month
String month = Jalali.now().month.toString().length == 2
    ? Jalali.now().month.toString()
    : '0${Jalali.now().month.toString()}';

//year
String year = Jalali.now().year.toString();

//date
String today = '$year/$month/$day';

class Calculate {
  static double paidToday() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date == today && value.isReceived == false) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double receivedToday() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date == today && value.isReceived) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double paidThisMonth() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date.substring(5, 7) == month && value.isReceived == false) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double receivedThisMonth() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date.substring(5, 7) == month && value.isReceived) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double paidThisYear() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date.substring(0, 4) == year && value.isReceived == false) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double receivedThisYear() {
    double result = 0;
    for (var value in hiveBox.values) {
      if (value.date.substring(0, 4) == year && value.isReceived) {
        result += double.parse(value.price);
      }
    }
    return result;
  }
}
