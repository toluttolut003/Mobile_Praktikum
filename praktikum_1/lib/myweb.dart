import 'package:flutter/material.dart';

class myweb extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tugas Mobile',
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Ini aplikasi saya', style: TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.green,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: .center,
                children: [Text(
                    'Halo Dunia!',
                    style: TextStyle(
                        fontSize: 100,
                        color: Colors.green,
                        fontWeight: .bold
                    ),
                    )],
            ),
        ),
    );
  }
}