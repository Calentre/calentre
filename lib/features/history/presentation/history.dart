import 'package:calentre/features/history/presentation/widget/history_list.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // return HistoryEmptyState();
    return const HistoryList();
  }
}
