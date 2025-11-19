import 'package:flutter/material.dart';
import '../models/conta.dart';
import '../widgets/conta_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Conta> contas = [
    Conta(titulo: "Internet", valor: 99.90, vencimento: DateTime(2025, 2, 10)),
    Conta(titulo: "Energia", valor: 210.45, vencimento: DateTime(2025, 2, 15)),
    Conta(titulo: "Água", valor: 85.70, vencimento: DateTime(2025, 2, 20)),
  ];

  void marcarComoPago(Conta conta) {
    setState(() {
      conta.paga = !conta.paga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciador de Contas a Pagar"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contas.length,
        itemBuilder: (context, index) {
          return ContaCard(
            conta: contas[index],
            onToggle: () => marcarComoPago(contas[index]),
          );
        },
      ),
    );
  }
}