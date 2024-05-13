import 'package:flutter/material.dart';
import 'package:list_view/practica1.dart';

void main(){
  runApp(_practica());
}

class _practica extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "ListView.builder",
      theme: ThemeData(useMaterial3: false),
      home: _home(title: "ListView - Practice buldier"),
    );
  }
}

class _home extends StatelessWidget{
  String? title;
  _home({Key? key, this.title}):super(key: key);

  List _guerrerosZ = [
    dbz("Goku", "Sayajin",Image.network("https://imgs.search.brave.com/gnVeWKAWIQYzeU7yEUwDrAoyKQNC4-V7rrfNWowdaoE/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2UyL2Uw/LzBiL2UyZTAwYmM5/YzZiYjc0Y2QwYjAz/OGVhZGNlMTU4MzQz/LmpwZw")),
    dbz("Piccolo", "Namekusei", Image.network("https://imgs.search.brave.com/__sXxtP2g7H0eFPRjxSWuePru9NeygiLhGxv0cRpwys/rs:fit:860:0:0/g:ce/aHR0cDovL20uZ2V0/dHl3YWxscGFwZXJz/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAyMy8wNy9QaWNj/b2xvLURwLmpwZw")),
    dbz("Krillin", "Humano", Image.network("https://imgs.search.brave.com/Kg5n-FeDiU8evliek6INE0nQrB_gE-gU10lAUp8xzig/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/MzQ4bjZ4c2dtbDk1/MS5qcGc_d2lkdGg9/NjQwJmNyb3A9c21h/cnQmYXV0bz13ZWJw/JnM9MDg1MWEwNDQ4/MmVmYjk5ZGZkYTUz/ZTBhZTA3YTA2NzU2/ZTI2OGNmMw")),
    dbz("Gohan","Sayajin/Humano",Image.network("https://imgs.search.brave.com/nvipegW42RjOK33KPqh8nImkEQ4hed39_QCGIxiW5f0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtd2l4bXAtZWQz/MGE4NmI4YzRjYTg4/Nzc3MzU5NGMyLndp/eG1wLmNvbS9mLzhj/ZTQ1M2Q5LTQwYzIt/NGNiZi1iZDM3LTYx/ODVjNWNkYTYwMi9k/Z3FvMzEyLTgwMjVi/ZTdlLWIwY2MtNDQ2/OC1iZGY2LTU1ZWQy/NTMyMjE3NC5wbmcv/djEvZmlsbC93XzY4/MSxoXzM1MCxxXzcw/LHN0cnAvdGVlbl9n/b2hhbl9zc2oyX19f/YW5pbWVfYnlfbGVv/cmtfZHJlYW1fZGdx/bzMxMi0zNTB0Lmpw/Zz90b2tlbj1leUow/ZVhBaU9pSktWMVFp/TENKaGJHY2lPaUpJ/VXpJMU5pSjkuZXlK/emRXSWlPaUoxY200/NllYQndPamRsTUdR/eE9EZzVPREl5TmpR/ek56TmhOV1l3WkRR/eE5XVmhNR1F5Tm1V/d0lpd2lhWE56SWpv/aWRYSnVPbUZ3Y0Rv/M1pUQmtNVGc0T1Rn/eU1qWTBNemN6WVRW/bU1HUTBNVFZsWVRC/a01qWmxNQ0lzSW05/aWFpSTZXMXQ3SW5C/aGRHZ2lPaUpjTDJa/Y0x6aGpaVFExTTJR/NUxUUXdZekl0TkdO/aVppMWlaRE0zTFRZ/eE9EVmpOV05rWVRZ/d01sd3ZaR2R4YnpN/eE1pMDRNREkxWW1V/M1pTMWlNR05qTFRR/ME5qZ3RZbVJtTmkw/MU5XVmtNalV6TWpJ/eE56UXVjRzVuSWl3/aWFHVnBaMmgwSWpv/aVBEMDJOVGdpTENK/M2FXUjBhQ0k2SWp3/OU1USTRNQ0o5WFYw/c0ltRjFaQ0k2V3lK/MWNtNDZjMlZ5ZG1s/alpUcHBiV0ZuWlM1/M1lYUmxjbTFoY21z/aVhTd2lkMjFySWpw/N0luQmhkR2dpT2lK/Y0wzZHRYQzg0WTJV/ME5UTmtPUzAwTUdN/eUxUUmpZbVl0WW1R/ek55MDJNVGcxWXpW/alpHRTJNREpjTDJ4/bGIzSnJMV1J5WldG/dExUUXVjRzVuSWl3/aWIzQmhZMmwwZVNJ/Nk9UVXNJbkJ5YjNC/dmNuUnBiMjV6SWpv/d0xqUTFMQ0puY21G/MmFYUjVJam9pWTJW/dWRHVnlJbjE5LllR/VkVQcGpzZmFoMjZW/bmgtNlBlZzVmMmNB/RnhEdk5sakhxT3k1/cGxfUm8") ),
    dbz("Vegeta", "Sayajin",Image.network("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4696cdf9-155b-4de2-981b-4cd6dc1f24b1/dg5ke3g-16cc4b61-334b-403a-9f45-5020cea924c0.png/v1/fit/w_828,h_464,q_70,strp/vegeta_phone_wallpaper_by_artificialfox00_dg5ke3g-414w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzE4IiwicGF0aCI6IlwvZlwvNDY5NmNkZjktMTU1Yi00ZGUyLTk4MWItNGNkNmRjMWYyNGIxXC9kZzVrZTNnLTE2Y2M0YjYxLTMzNGItNDAzYS05ZjQ1LTUwMjBjZWE5MjRjMC5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.8UvHizHXnVlYtsuS_yCu24ncUPz0ENCKAzlRseEPsVg",
    )),
    dbz("Gotenks", "Fusion", Image.network("https://i.pinimg.com/originals/15/17/8c/15178ce6bbc70d057be4023f9d07f7c9.jpg"))
  ];

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        actions: [
          Icon(Icons.star, color: Colors.orange,),
        ],
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: _guerrerosZ.length,
          itemBuilder: (context, index) {
            final guerrerosZ = _guerrerosZ[index];
            return ListTile(
              title: Text(
                guerrerosZ.nombre,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.orangeAccent),
                ),
              subtitle: Text(
                guerrerosZ.raza,
                textAlign: TextAlign.center ,
                style: TextStyle(fontSize: 15),
              ),
              hoverColor: Colors.black12,
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){ //SIEMPRE EL BuildContext tiene que estar entre parentesis
                      return AlertDialog(
                        title: Text("Nombre: ' ${guerrerosZ.nombre} '\nRaza: ' ${guerrerosZ.raza} '"),
                        content: guerrerosZ.foto,
                      );
                });
              },
            );
          },
      ),
    );
  }
}