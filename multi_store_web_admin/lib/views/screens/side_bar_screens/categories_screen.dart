
import 'package:flutter/cupertino.dart';

class CategoriesScreen extends StatelessWidget{
  static const String routeName = '\Categories';
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context){
    return  SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      );

  }

}