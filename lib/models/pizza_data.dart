import 'package:pizzeria/models/Pizza.dart';

class PizzaData {

  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, 'Barbecue', 'La garniture', 'four.jpeg', 8));
    list.add(Pizza(2, 'Hawai', 'La garniture', 'pizzaFirst.jpeg', 9));
    list.add(Pizza(3, 'Epinards', 'La garniture', 'three.jpeg', 7));
    list.add(Pizza(4, 'Végetarienne', 'La garniture', 'two.jpeg', 10));
    return list;
  }
}