import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Container(
        height: 35,
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<String>(
              groupValue: groupValue,
              value: value,
              onChanged: (String? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label, style: GoogleFonts.inter(fontSize: 14,),),
          ],
        ),
      ),
    );
  }
}
