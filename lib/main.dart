import 'package:flutter/material.dart';
import 'package:tabbar/primeirapagina.dart';
import 'package:tabbar/segundapagina.dart';
import 'package:tabbar/terceirapagina.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abas"),
        // ignore: prefer_const_constructors
        bottom: TabBar(
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(
              //text: "Home",
              icon: Icon(Icons.home),
            ),
            const Tab(
              //text: "Email",
              icon: Icon(Icons.email),
            ),
            const Tab(
              //text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        PrimeiraPagina(),
        SegundaPagina(),
        TerceiraPagina()
      ]),
    );
  }
}
