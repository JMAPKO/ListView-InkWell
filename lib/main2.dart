// inkWell es un onTap mas sencible yaa que se puede:
// mantener presionado
// se puede cancelar, doble click, un click, etc


// ese efecto tipo 3d se logra usando el BoxShadow junto con el grandient
// ambos son implementaciones del boxdecoration

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_view/comidas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'APP - ListView Comidas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List _comidas = [
    Comida("Bife","Carnes",Image.asset("Assets/Images/carne.jpg")),
    Comida("Arroz","Granos",Image.asset("Assets/Images/arroz.jpg")),
    Comida("Jugo", "Bebidas",Image.asset("Assets/Images/chocolate.jpg")),
    Comida("Pollo", "Carnes",Image.asset("Assets/Images/pollo.jpg")),
    Comida("Queso", "Lacteos",Image.asset("Assets/Images/queso.jpg")),
    Comida("Salmon", "Pescado",Image.asset("Assets/Images/salmon.jpg")),
    Comida("Sorrentinos", "Pastas",Image.asset("Assets/Images/sorrentinos.jpeg")),
    Comida("Torta de chocolate", "Postre",Image.asset("Assets/Images/torta.jpg")),
    Comida("vino", "Bebidas",Image.asset("Assets/Images/vino.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title, style: TextStyle(color: Colors.white),),
        ),
        body:ListView.builder(
          itemCount: _comidas.length, // importante el length para que sepa el tamaño del listView
          itemBuilder: (context, index){
            final comida = _comidas[index];
            return Dismissible(
              direction: DismissDirection.startToEnd,
              key: Key(comida.nombre),
              background: Container(
                child: Icon(Icons.delete,
                  size: 35,
                  color: Colors.white,
                ),
                color: Colors.cyan,
              ),
              onDismissed: (direction) {
                setState(() {
                  _comidas.removeAt(index); //ESTE METODO ES PARA BORRAR LOS ELEMENTOS DE LA LISTA
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${comida.nombre} fue eliminado"),
                        action: SnackBarAction(
                          label: "cerrar",
                          onPressed: (){
                            setState(() {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            });
                          },
                        ),
                      )
                  );
                });
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(8),
                child: InkWell(
                  onDoubleTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Plato: ${comida.nombre}", style: TextStyle(fontSize: 25, color: Colors.red),),
                            content: comida.imagen,
                          );
                        }
                    );
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.cyan[100]!,Colors.cyan[900]!],
                      ),
                      boxShadow: [BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 30,
                        spreadRadius: 7,
                        offset: Offset(1,15)
                      )]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${comida.nombre}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[700]
                          ),
                        ),
                        Text("${comida.categoria}",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
            );
          },
        )
    );
  }
}
