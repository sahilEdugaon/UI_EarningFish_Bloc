import 'package:earning_fish_ui/utlits/const_Color.dart';
import 'package:flutter/material.dart';

class StatusProgressIndicator extends StatefulWidget {
  final int segments; // Number of segments
  final int currentIndex; // The current segment that is highlighted

  StatusProgressIndicator({required this.segments, required this.currentIndex});

  @override
  _StatusProgressIndicatorState createState() => _StatusProgressIndicatorState();
}

class _StatusProgressIndicatorState extends State<StatusProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(widget.segments, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: LinearProgressIndicator(
                    minHeight: 7,
                    borderRadius: BorderRadius.circular( index <= widget.currentIndex? 5 : 0.0),
                    value: index <= widget.currentIndex ? 1.0 : 0.0,
                    backgroundColor: Colors.grey[300], // Color for uncompleted segments
                    valueColor: AlwaysStoppedAnimation<Color>(
                      index == widget.currentIndex ? ConstColor.buttonColor : ConstColor.textFieldCardGreyColor, // Color for completed segments
                    ),
                  ),
                ),
              );
            }),
          //   
        ),
        //    
    );
   //   
  }
}