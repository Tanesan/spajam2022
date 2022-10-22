import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketService {
  late final WebSocketChannel _channel;

  WebsocketService(String uri) {
    _channel = WebSocketChannel.connect(Uri.parse(uri));
  }

  Stream listen() {
    return _channel.stream;
  }

  void send(String message) {
    _channel.sink.add(message);
  }

  void close() {
    _channel.sink.close();
  }
}
