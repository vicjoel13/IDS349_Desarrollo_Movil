
import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatelessWidget{
  static const String routeName = '\Dashboard';

  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      );
  }

}