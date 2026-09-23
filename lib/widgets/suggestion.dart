import 'package:flutter/material.dart';


class DailySuggestionsWidget extends StatelessWidget{
  const DailySuggestionsWidget({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
    );
      }

  Widget _box({required Widget child}){
    return Container(
      height : 120,
      decoration: BoxDecoration(
        color : Colors.grey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset:  const Offset(0, 4),

          ),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}