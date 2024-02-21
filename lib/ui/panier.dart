import 'package:flutter/material.dart';
import 'package:pizzeria/ui/share/total_widget.dart';

import '../models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart,{Key? key}) : super(key: key);



  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  double totalPrice=0;
  double htPrice=0;
  double taxPrice=0;
  void  total(){
     htPrice=0;
     taxPrice=0;
    totalPrice=0;
    for (var  i = 0; i < widget._cart.totalItems(); i++){
      totalPrice+=(widget._cart.getCartItem(i).pizza.total* widget._cart.getCartItem(i).quantity);

    }
    taxPrice = (totalPrice*20)/100;

    htPrice = totalPrice - taxPrice;
  }
  @override
  Widget build(BuildContext context) {
    total();
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget._cart.totalItems(),
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(widget._cart.getCartItem(index));
              },
            ),
          ),
          Container(
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                    children: [
                      Container(),
                      Text("Total HT", style: TextStyle(color: Colors.grey)),
                      Text('${htPrice}', style: TextStyle(color: Colors.grey))
                    ]
                ),
                TableRow(
                    children: [
                      Container(),
                      Text("TVA", style: TextStyle(color: Colors.grey)),
                      Text('${taxPrice}', style: TextStyle(color: Colors.grey))
                    ]
                ),
                TableRow(
                    children: [
                      Container(),
                      Text("Total TTC", style: TextStyle(color: Colors.blue)),
                      Text('${totalPrice}', style: TextStyle(color: Colors.blue))
                    ]
                ),
              ],
            ),
          ),
          Container( width: double.infinity,
            child:
                Expanded(
            child:  ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
              ),
              child: Text('Valider Le Panier'),
              onPressed: () {
                print('Valider');
              },
            ),
          )

          )
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Row(
      children: [
        Image.asset(
          'assets/images/pizzas/${cartItem.pizza.image}',
          height: 100,
        ),
        SizedBox(width: 16), // Ajoute un espace entre l'image et le texte
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.pizza.title),
              Row(
                children: [
                  Text('${cartItem.pizza.total} euro'),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget._cart.removeProduct(cartItem
                                .pizza); // Décrémente la quantité de ce produit dans le panier
                          });
                          print("moins");
                        },
                        icon: Icon(Icons.minimize),
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget._cart.addProduct(cartItem
                                .pizza); // Incrémente la quantité de ce produit dans le panier
                          });
                          print("plus");
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              TotalWidget(cartItem.pizza.total * cartItem.quantity),
            ],
          ),
        ),
      ],
    );
  }

}