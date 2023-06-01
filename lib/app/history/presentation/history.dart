import 'package:calentre/app/history/presentation/widget/history_card.dart';
import 'package:calentre/app/history/presentation/widget/history_empty_state.dart';
import 'package:calentre/app/history/presentation/widget/history_list.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // return HistoryEmptyState();
    return HistoryList();
  }
}
