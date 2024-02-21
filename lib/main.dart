import 'package:flutter/material.dart';
import 'package:pizzeria/ui/pizza_list.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';

import 'models/cart.dart';
import 'models/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pizzéria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'pizzéria'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  Cart _cart;
  MyHomePage({required this.title, Key? key}) :
        _cart = Cart(),
        super(key: key);

  var _menus = [
    Menu(1,'Entrées', 'four.jpeg', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizzaFirst.jpeg', Colors.redAccent),
    Menu(3, 'Desserts', 'three.jpeg', Colors.brown),
    Menu(4, 'Boissons', 'two.jpeg', Colors.lightBlue),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBarWidget(title, _cart),
       body: Center(
         child: ListView.builder(
           itemCount: _menus.length,
           itemBuilder: (context, index) => InkWell(
             onTap: () {
               switch( _menus[index].type) {
                  case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PizzaList(_cart)),
                    );
                    break;
                  }
             },
              child: _buildRow(_menus[index]),
           ),
           itemExtent: 180,
         )
       )
    );
  }

  _buildRow(Menu menu) {
    return Column(
      children: <Widget> [
        Container(
          height: 120,
          child: Image.asset(
              'assets/images/menus/${menu.image}',
              fit: BoxFit.fitWidth,
          ),
        ),
        Text(menu.title)
      ],
    );
  }
}
