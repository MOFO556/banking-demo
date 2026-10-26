import 'package:flutter/material.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';

class MissionScaffold extends StatelessWidget {
  const MissionScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.bottomBar,
    this.statusSlot,
    this.actions,
  });

  final String title;
  final Widget body;
  final Widget bottomBar;

  final Widget? statusSlot;
  final List<Widget>? actions;

  static const double statusSlotHeight = 48;

  @override
  Widget build(BuildContext context) {
    return MofoScaffold(
      title: title,
      actions: actions,
      body: Column(
        children: [
          Expanded(child: body),
          SizedBox(
            height: statusSlotHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: statusSlot ?? const SizedBox.shrink(),
              ),
            ),
          ),
          Material(
            color: MofoColors.of(context).surface,
            elevation: 8,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: bottomBar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
