import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kalkulator BMI",
      home: BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController(); // _ = private
  final _tbController = TextEditingController();

  double? _hasilBMI; // ? apakah terisi atau tidak
  String _keterangan = "Masukkan Data Anda!!!";

  void _hitungBMI(){
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if(bb > 0 && tbCm > 0){
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        if(hasil < 18.5){
          _keterangan = "Kurusss";
        }else if(hasil < 25){
          _keterangan = "Mantap Euy Ideal";
        }else if(hasil < 30){
          _keterangan = "Kelebihan Berat Badan";
        }else {
          _keterangan = "Obesitas";
        }
      }else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid!!!";
      }
    });
  }
//Do you calculate BMI differently for men and women?
//No, the BMI formula for both men and women is the same and does not differ in any way. sumber https://hs770.com/bmi-chart-men-vs-women/
    void _hitungBMIWanita(){
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if(bb > 0 && tbCm > 0){
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        if(hasil < 18.5){
          _keterangan = "Kurusss";
        }else if(hasil < 25){
          _keterangan = "Mantap Euy Ideal";
        }else if(hasil < 30){
          _keterangan = "Kelebihan Berat Badan";
        }else {
          _keterangan = "Obesitas";
        }
      }else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid!!!";
      }
    });
  }

  void _resetBMI(){
    setState(() {
      _bbController.clear();
      _tbController.clear();
    _hasilBMI = null;
    _keterangan = "Masukan Data Anda!!!";
    });
  }

  @override
  void dispose(){
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(
            fontWeight: .bold,
            letterSpacing: 5,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility, color: Colors.white,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.monitor_weight, size: 30,),
                  labelText: 'Berat Badan',
                  labelStyle: TextStyle(letterSpacing: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),

              SizedBox(height: 15,),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.height, size: 30,),
                  labelText: 'Tinggi Badan',
                  labelStyle: TextStyle(letterSpacing: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text('Hitung sesuai Gender anda :',textAlign: .center,),

              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: _hitungBMI,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20)
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Laki-Laki',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    Icon(Icons.male, size: 50, color: Colors.blue,)
                  ],
                )
              ),

              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: _hitungBMIWanita,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Row(mainAxisAlignment: .center,
                  children: [
                    Text(
                  'Wanita',
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 173, 200)),
                    ),
                  Icon(Icons.female, size: 50, color: const Color.fromARGB(255, 255, 173, 200))
                  ],
                )
              ),

              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: _resetBMI,
                style: ElevatedButton.styleFrom(
                  padding:  EdgeInsetsDirectional.symmetric(vertical: 20),
                  backgroundColor: Colors.blue
                ), 
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text('Reset', style: TextStyle(fontSize: 20, color: Colors.white),),
                    Icon(Icons.restart_alt, color: Colors.white,)
                  ],
                ),
                ),
              SizedBox(height: 15,),
              Text(
                'Hasil (Pria) : ',
                textAlign: .center,
              ),

              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? 'Nilai Kosong',
                      style: TextStyle(fontSize: 50, fontWeight: .bold, color: Colors.white),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      _keterangan,
                      style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 224, 33, 19)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}