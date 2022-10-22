import 'package:flutter/material.dart';
import 'package:spajam2022/constants.dart';

import '../../services/websocket_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final websocketService = WebsocketService(Constants.websocketEndpoint);

  @override
  void dispose() {
    websocketService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: websocketService.listen(),
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => websocketService.send("Hello"),
        tooltip: 'Send Hello',
        child: const Icon(Icons.send),
      ),
    );
  }
}
