part of 'transaction_bloc.dart';

class TransactionEvent {
  final String type;
  final String token;

  TransactionEvent({required this.type, required this.token});
}
