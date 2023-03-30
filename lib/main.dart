import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ToDo  Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alışveriş Listesi Uygulaması"),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  var t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, index) => ListTile(
                    subtitle: Text("Alışveriş Malzemeleri"),
                    title: Text(alisverisListesi[index]),
                  )),
        ),
        TextField(
          controller: t1,
        ),
        Row(
          children: [
          ElevatedButton(
            onPressed: elemanEkle,
            child: const Text("Ekle"),
          ),
          ElevatedButton(onPressed: elemanCikar, child: const Text("Çıkar")),
        ])
      ],
    );
  }
}
