import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const GerenciadorApp());
}

class GerenciadorApp extends StatelessWidget {
  const GerenciadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Contas',
      home: const HomePage(), 
    );
  }
}
