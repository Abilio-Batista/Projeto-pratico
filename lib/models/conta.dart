class Conta {
  final String titulo;
  final double valor;
  final DateTime vencimento;
  bool paga;

  Conta({
    required this.titulo,
    required this.valor,
    required this.vencimento,
    this.paga = false,
  });
}
