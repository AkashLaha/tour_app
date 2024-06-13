import 'package:tour_app/card_class.dart';

class ListCard{
  List<CardClass> listcard=[
    CardClass('Varanasi','25000','images/varanasi.jpg'),
    CardClass('Ladakh','30000','images/ladakh.jpg'),
    CardClass('Kolkata','15000','images/kolkata.jpg'),
  ];
  void removeCard(int index) {
    if (index >= 0 && index < listcard.length) {
      listcard.removeAt(index);
    }
  }
}