import 'package:flutter/material.dart';




class HomePage extends StatefulWidget  {


  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int count=0;


  void increment(){


    setState(() {
      count++;
   
    });
  }


  void decrement(){


    setState(() {
      count--;
    });
  }




  bool get zerado => count == 0;
  bool get cheio => count == 2;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img_fundo.png"),
            fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cheio ? "Acesso Bloqueado" : "Acesso Liberado",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
            ),
            Text(count.toString(),
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 0, 0),
                    disabledBackgroundColor: const Color.fromARGB(255, 43, 41, 41),
                    fixedSize: const Size(110,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                  ),
                  onPressed: zerado ? null : decrement,
                  child: const Text("Sair",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                  ),),
                  ),
                  SizedBox(width: 40,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 197, 0),
                    disabledBackgroundColor: const Color.fromARGB(255, 43, 41, 41),
                    fixedSize: const Size(110,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                  ),
                  onPressed: cheio ? null : increment,
                  child: const Text("Entrar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  ),
              ],
            ),
          ],
         
        ),
      ),
    );
  }
}
