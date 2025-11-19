import 'package:flutter/material.dart';
import '../models/conta.dart';

class ContaCard extends StatelessWidget {
  final Conta conta;
  final VoidCallback onToggle;

  const ContaCard({
    super.key,
    required this.conta,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(
          conta.titulo,
          style: TextStyle(
            decoration:
                conta.paga ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          "R\$ ${conta.valor.toStringAsFixed(2)} • Vence em ${conta.vencimento.day}/${conta.vencimento.month}/${conta.vencimento.year}",
        ),
        trailing: Checkbox(
          value: conta.paga,
          onChanged: (_) => onToggle(),
        ),
      ),
    );
  }
}