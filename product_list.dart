import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_details.dart';
import 'package:shop_app/widgets/global_variables.dart';
import 'package:shop_app/product_card.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
    final List<String> filters =const['All','Adidas','Nike','Pro','Bata','Puma'];
   late String filterselected;

    @override
   void initState(){
    super.initState();
    filterselected=filters[0];

   }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final border= OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                        ),
                    );

    return  SafeArea(
  child: Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Shoes\nCollection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: border,
                enabledBorder: border,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 120,
        child: size.width > 650 ? GridView.builder(
          
          itemCount: filters.length,
          gridDelegate: 
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            final filter = filters[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    filterselected = filter;
                  });
                },
                child: Chip(
                  backgroundColor: filterselected == filter
                      ? Colors.amberAccent
                      : const Color.fromRGBO(245, 247, 249, 1),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 145, 172, 186),
                  ),
                  label: Text(
                    filter,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
              ),
            );
          },
        ) 
        : ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDetails(products: product);
                    },
                  ),
                );
              },
              child: ProductCard(
                title: product['Title'] as String,
                price: product['price'] as int,
                image: product['imageUrl'] as String,
                bgcolor: index.isEven
                    ? const Color.fromRGBO(216, 240, 253, 1)
                    : const Color.fromRGBO(245, 247, 249, 1),
              ),
            );
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDetails(products: product);
                    },
                  ),
                );
              },
              child: ProductCard(
                title: product['Title'] as String,
                price: product['price'] as int,
                image: product['imageUrl'] as String,
                bgcolor: index.isEven
                    ? const Color.fromRGBO(216, 240, 253, 1)
                    : const Color.fromRGBO(245, 247, 249, 1),
              ),
            );
          },
        ),
      ),
    ],
  ),
);

  
  }
}
     