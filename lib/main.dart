import 'package:flutter/material.dart';
import 'package:color_palette_flutter_app/data_ac%D1%81ess/i_color_repository.dart';
import 'package:color_palette_flutter_app/data_acсess/mock_color_repository.dart';
import 'package:color_palette_flutter_app/Screens/palette_screen.dart';
import 'package:color_palette_flutter_app/themes.dart';

void main() {
  final repo = MockColorRepository();

  runApp(MainApp(repo: repo));
}

class MainApp extends StatelessWidget {
  final IColorRepository _repo;

  const MainApp({super.key, required IColorRepository repo}) : _repo = repo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: PaletteScreen(
        repository: _repo,
      ),
    );
  }
}
