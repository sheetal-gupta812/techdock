import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class BorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final double width;
  final FontWeight weight;
  final double size;

  const BorderButton({
    Key? key,
    required this.textName,
    required this.onPressed,
    required this.width,
    required this.weight,
    required this.size,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: width,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
          ),
          primary: ColorData.blue,
        ),

        onPressed: () {
          onPressed();
        },
        child: Text(
            textName,
            style: GoogleFonts.lato(
              color: ColorData.black,
              fontWeight: weight,
              fontSize: size,
            )
        ),
      ),
    );
  }
}