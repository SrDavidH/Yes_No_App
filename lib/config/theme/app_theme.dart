import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);//Se pone 0xFF y despues el numero decimal del color, en este caso es: 5C11D4
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,

];

class AppTheme{
//variables
  final int selectedColor;
//constructor
  AppTheme({
    this.selectedColor = 0
  }):assert(selectedColor >=0 && selectedColor <=6, 
  'Colors must be between 0 and ${_colorThemes}');


  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]);//con colorSchemeSeed podemos traer la lista de colors _colorThemes
  }
}
      //brightness: Brightness.dark este es para poner el modo oscuro 
      