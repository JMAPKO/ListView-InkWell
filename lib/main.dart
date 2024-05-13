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
                elevation: 15,
                child: ListTile(
                  title: Text("opcion: ${comida.nombre}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent
                    ),
                  ),
                  subtitle: Text("${comida.categoria}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                  hoverColor: Colors.black12,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(comida.nombre),
                          content: comida.imagen,
                        );
                      },
                    );
                  }

                ),
              ),
            );
          },
      )
    );
  }
}
