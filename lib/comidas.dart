import 'package:flutter/material.dart';

class Comida {
  String nombre;
  String categoria;
  Image imagen;

  Comida(this.nombre, this.categoria, this.imagen);
}


//Lista completa por si se necesita recuperar:

//List _comidas = [
//     Comida("Bife","Carnes",Image.asset("Assets/Images/carne.jpg")),
//     Comida("Arroz","Granos",Image.asset("Assets/Images/arroz.jpg")),
//     Comida("Jugo", "Bebidas",Image.asset("Assets/Images/chocolate.jpg")),
//     Comida("Pollo", "Carnes",Image.asset("Assets/Images/pollo.jpg")),
//     Comida("Queso", "Lacteos",Image.asset("Assets/Images/queso.jpg")),
//     Comida("Salmon", "Pescado",Image.asset("Assets/Images/salmon.jpg")),
//     Comida("Sorrentinos", "Pastas",Image.asset("Assets/Images/sorrentinos.jpeg")),
//     Comida("Torta de chocolate", "Postre",Image.asset("Assets/Images/torta.jpg")),
//     Comida("vino", "Bebidas",Image.asset("Assets/Images/vino.jpg")),
//   ];