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
    return Container(
      child:
       Row(
        children: [

          Expanded(child: _box(child: left)),
          Expanded(child: _box(child: right)),
        ],
      ),
    );
  }

  Widget _box({required Widget child}) {
    return Container(
      width: 40,
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
      child: child,
    );
  }
}
