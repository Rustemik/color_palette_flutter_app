import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/DataAc%D1%81ess/mock_color_repository.dart';
import 'package:surf_flutter_courses_template/Screens/palette_screen.dart';
import 'package:surf_flutter_courses_template/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = MockColorRepository();

    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: PaletteScreen(
        repository: repo,
      ),
    );
  }
}
