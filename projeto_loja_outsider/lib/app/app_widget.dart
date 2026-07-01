import 'package:flutter/material.dart';
import 'package:projeto_camiseta_outisder/app/view/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
