import 'package:demo_ar_camera/view/ar_screen_page.dart';
import 'package:demo_ar_camera/view/location_view_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Container(
        child: Center(
            child: ElevatedButton(
          child: const Text("LocationView"),
          onPressed: () async {
            await showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    title: const Text("カメラ利用の許可をする"),
                    actions: <Widget>[
                      ElevatedButton(
                          onPressed: () async {
                            if (openAppSettings() == false) {
                              await openAppSettings();
                            }
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationViewPage(),
                              ),
                            );
                          },
                          child: const Text("OK"))
                    ],
                  );
                }));
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArScreenPage(),
            ),
          );
        },
        child: const Icon(Icons.camera_alt_sharp),
      ),
    );
  }
}
