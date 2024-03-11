import 'package:flutter/material.dart';
import 'package:flutter_project/page/home.dart';
import 'package:flutter_project/page/my_resource.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        )),
        home: const Responsive());
  }
}

final drawerList = [const Home(),  const MyResource()];

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => switch (
                constraints.maxWidth) {
              <= 650 => Mobile(),
              > 650 && <= 1100 => Tablet(),
              _ => Tablet()
            });
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(100, 60);
}

class Mobile extends StatelessWidget {
  final selectedIndex = 0.obs;

  Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _AppBar(),
        drawer: _Drawer(
          selectedIndex: selectedIndex,
        ),
        body: Obx(() => drawerList[selectedIndex.value]));
  }
}

class Tablet extends StatelessWidget {
  final selectedIndex = 0.obs;
  Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        _Drawer(selectedIndex: selectedIndex),
        Expanded(
            child: Column(
          children: [
            const _AppBar(),
            Obx(() => Expanded(child: drawerList[selectedIndex.value]))
          ],
        ))
      ],
    ));
  }
}

class _Drawer extends StatelessWidget {
  final Rx<int> selectedIndex;

  const _Drawer({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    void onTapped(int index) {
      selectedIndex.value = index;
      if (Navigator.canPop(context)) Navigator.pop(context);
    }

    return Obx(() => NavigationDrawer(
            onDestinationSelected: onTapped,
            selectedIndex: selectedIndex.value,
            children: [
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const NavigationDrawerDestination(
                icon: Icon(Icons.message),
                label: Text('Messages'),
              ),
              const NavigationDrawerDestination(
                icon: Icon(Icons.account_circle),
                label: Text('Profile'),
              ),
            ]));
  }
}

class DrawerTwo extends StatelessWidget {
  const DrawerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [Text('Drawer Two')]);
  }
}
