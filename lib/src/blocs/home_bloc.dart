import 'dart:async';

class HomeBloc {
  final StreamController<bool> _isENG = StreamController<bool>();

  Stream<bool> get isEngStream => _isENG.stream;

  void setIsENG(bool isENG) => _isENG.add(isENG);

  void dispose() {
    _isENG.close();
  }
}
