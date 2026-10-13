import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Nama Digital',
      home: BusinessCardScreen(),
      );
  }
}

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfLHy2pLEnJ1FHb0Mcf9bck34zNuklINCTdGkVN3ApUiGr4u_7AgaEC9Q&s=10'),
              ),

            SizedBox(height: 10.0,),
            Text(
              'Tolut',
              style: GoogleFonts.pacifico(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),
              ),

              Text(
                'Mahasiswa Dan Programmer',
                style: GoogleFonts.sourceSans3(
                  fontSize: 20.0,
                  color: Colors.white,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.blue.shade100,
                ),
              ),

              Card(margin: const EdgeInsets.symmetric(
                vertical: 10.0, 
                horizontal: 25.0,
                ),
              child: ListTile(
                leading: Icon(
                  Icons.phone, 
                  color: Colors.blue
                  ),
                title: Text(
                  '0898-5972-722',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0
                    ),
                  ),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'toluttolut12@gmail.com',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '@Arion_245',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.tiktok,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '@Tolut22',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),
              



            ],
          ),
        )),
    );
  }
}