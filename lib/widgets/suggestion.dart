import 'package:flutter/material.dart';

class DailySuggestionsWidget extends StatelessWidget {
  final Widget left;
  final Widget right;

  const DailySuggestionsWidget({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: _box(child: left)),
          const SizedBox(width: 12),          
          Expanded(child: _box(child: right)),
        ],
      ),
    );
  }

  Widget _box({required Widget child}) {
    return Container(
      height: 120,                            
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,            
      child: child,
    );
  }
}