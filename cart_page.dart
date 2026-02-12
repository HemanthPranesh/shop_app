import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
//import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
     appBar: AppBar(
      title: Text("Cart"),
     ),
     body: ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context,index){
         final cartItem = cart[index];

         return ListTile(
            trailing: IconButton( 
              onPressed: (){
                showDialog(context: context,
                
                 builder: (context){
                  return AlertDialog(
                    
                    title: Text('Delete',
                    style: Theme.of(context).textTheme.titleMedium,
                    ),
                  content: Text(
                    'Are you sure?'
                    ),
                    actions: [
                      TextButton(onPressed:
                      (){
                        context.read<CartProvider>().removeProduct(cartItem);
                        
                        
                        Navigator.of(context).pop();
                      },
                       child: Text('Yes',
                       style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                       ),
                       ),
                       ),
                       TextButton(onPressed:
                      (){
                        Navigator.of(context).pop();
                      },
                       child: Text('No',
                       style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                       ),
                       ),
                       ),
                    ],
                  );
                 });
              }, 
            icon: Icon(
             Icons.delete,
            color: Colors.red,
            ),
            ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            radius: 40,
          ),
          title: Text(
            style: Theme.of(context).textTheme.bodySmall,
            cartItem['Title'].toString(), 
          ),
          subtitle: Text('Size: ${cartItem['sizes']}',
          style: Theme.of(context).textTheme.bodySmall,
          ),
         );
      },
     
     ),

    );
  }
}