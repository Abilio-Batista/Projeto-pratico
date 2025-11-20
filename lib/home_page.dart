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
    Conta(titulo: "Internet", valor: 99.90, vencimento: DateTime(2025, 3, 10)),
    Conta(titulo: "Energia", valor: 210.45, vencimento: DateTime(2025, 3, 15)),
    Conta(titulo: "Cartão de crédito", valor: 265.86, vencimento: DateTime(2025, 3, 31)),
    Conta(titulo: "Plano de saúde", valor: 89.00, vencimento: DateTime(2025, 3, 31)),
    Conta(titulo: "Faculdade", valor: 355.70, vencimento: DateTime(2025, 3, 10)),
  ];

  double get totalAPagar {
    return contas
        .where((c) => !c.paga)
        .fold(0.0, (soma, conta) => soma + conta.valor);
  }

  void marcarComoPago(Conta conta) {
    setState(() {
      conta.paga = !conta.paga;
    });
  }

  void adicionarConta(String titulo, double valor, DateTime venc) {
    setState(() {
      contas.add(Conta(titulo: titulo, valor: valor, vencimento: venc));
    });
  }

  void abrirModalAdicionarConta() {
    String titulo = "";
    String valorTexto = "";
    DateTime venc = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Título"),
                onChanged: (v) => titulo = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Valor"),
                keyboardType: TextInputType.number,
                onChanged: (v) => valorTexto = v,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  adicionarConta(
                    titulo,
                    double.tryParse(valorTexto) ?? 0.0,
                    venc,
                  );
                  Navigator.pop(context);
                },
                child: const Text("Adicionar conta"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciador de Contas a Pagar"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: abrirModalAdicionarConta,
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total a pagar:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "R\$ ${totalAPagar.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: contas.length,
              itemBuilder: (context, index) {
                return ContaCard(
                  conta: contas[index],
                  onToggle: () => marcarComoPago(contas[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
