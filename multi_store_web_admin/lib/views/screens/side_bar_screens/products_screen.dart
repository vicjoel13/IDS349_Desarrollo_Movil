
import 'package:flutter/cupertino.dart';

class ProductsScreen extends StatelessWidget{
  static const String routeName = '\ProductsScreen';
  const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        )
    );
  }

}