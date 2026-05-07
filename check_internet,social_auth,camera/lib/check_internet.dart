import 'dart:async';
import 'package:check_internet/Camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CheckInternet extends StatefulWidget {
  const CheckInternet({super.key});

  @override
  State<CheckInternet> createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  String connectionType = "Unknown";
  StreamSubscription<List<ConnectivityResult>>? _connectivityStreamSubscription;

  bool isConnectedToInternet = false;
  StreamSubscription? _internetConnectionStreamSubscription;
  @override
  void initState() {
    super.initState();

    // Internet status stream (from your existing package)
    _internetConnectionStreamSubscription = InternetConnection().onStatusChange
        .listen((event) {
          setState(() {
            isConnectedToInternet = event == InternetStatus.connected;
          });
        });

    _connectivityStreamSubscription = Connectivity().onConnectivityChanged
        .listen((result) {
          setState(() {
            if (result.contains(ConnectivityResult.mobile)) {
              connectionType = "Mobile Data";
            } else if (result.contains(ConnectivityResult.wifi)) {
              connectionType = "Wi-Fi";
            } else if (result.contains(ConnectivityResult.ethernet)) {
              connectionType = "Ethernet";
            } else if (result.contains(ConnectivityResult.vpn)) {
              connectionType = "VPN";
            } else if (result.contains(ConnectivityResult.bluetooth)) {
              connectionType = "Bluetooth";
            } else if (result.contains(ConnectivityResult.other)) {
              connectionType = "Other Network";
            } else if (result.contains(ConnectivityResult.none)) {
              connectionType = "No Network";
            } else {
              connectionType = "Unknown";
            }
          });
        });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    _connectivityStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Internet Checker")),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isConnectedToInternet ? Icons.wifi : Icons.wifi_off,
              size: 60,
              color: isConnectedToInternet ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              isConnectedToInternet
                  ? "You are connected to the internet"
                  : "You are not connected to the internet",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Connection Type: $connectionType",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Camera()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
