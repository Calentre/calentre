import 'package:calentre/features/payments/presentation/widgets/payment_list.dart';
import 'package:flutter/material.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentList();
    // return const PaymentsEmptyState();
  }
}
