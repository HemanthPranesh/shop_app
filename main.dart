import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shop_app/global_variables.dart';
import '../pages/home_page.dart';
//import 'package:shop_app/product_details.dart';
import '../cart_provider.dart';
void main(){
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(245,245,245,1)),
          fontFamily: 'Lato',
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
                
            ),
            titleLarge: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.bold,
                      ),
            bodySmall:
             TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
          
          ),
          
          ),
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
            ),
          
            useMaterial3: true,
          
        ),
        home: HomePage(),
        //ProductDetails(
        //  products: products[0],
        // ),
      ),
    );
  }
}
