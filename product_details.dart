import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetails
 extends StatefulWidget {
  final  Map<String,Object> products;
 
  const ProductDetails
  (
     
    {
    super.key,
    required this.products,
  
    }
    );
   
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
   int selectedsize=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(child:
         Text('Details'),
         ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.products['Title'] as String,
            style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.products['imageUrl'] as String),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(245, 247, 249, 5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Text('\$${widget.products['price']}',  
             style: Theme.of(context).textTheme.titleLarge,
          
             ),

             SizedBox(height: 20,),
             SizedBox(height: 70,
               child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (widget.products['sizes'] as List<int>).length,
                itemBuilder: (context,index){
                  final size= (widget.products['sizes'] as List<int>)[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedsize=size;
                        });
                      },
                      child: Chip(label: Text(size.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        backgroundColor: selectedsize == size 
                        ? Theme.of(context).colorScheme.primary 
                        : null
                      ),
                      ),
                      ),
                    ),
                  );
                },
               ),
             ),
             SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(16),
               child: ElevatedButton(onPressed: (){
              if(selectedsize!=0){
                Provider.of<CartProvider>(context,listen: false,)
                .addProduct(
                 {  'id': widget.products['id'],
      'company':widget.products['company'],
    'Title':widget.products['Title'],
    'price':widget.products['price'],
    'sizes':selectedsize,
    'imageUrl':widget.products['imageUrl'],
                 }
                );
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:Text('Product added to cart sucessfully'),
                  ),
                  );
              } 
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:Text('Please select a size') 
                  ),
                );

              }
               },
               style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                minimumSize: Size(double.infinity, 50),
               ),
               
                child: Text('Add to Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),)
               ),
             ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}