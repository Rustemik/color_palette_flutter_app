import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          overflow: TextOverflow.visible,
          "Эксклюзивная палитра\n«Colored Box»",
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: const Color(0xFF252838),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 42, 16, 33),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 22,
          mainAxisSpacing: 40,
          childAspectRatio: 100 / 140,
          children: List.generate(
            20,
            (index) => Container(
              height: 140,
              width: 100,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
