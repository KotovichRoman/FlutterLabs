mixin Ball {
  late int _size;

  int get size => _size;

  void takeBall(int size) {
    _size = size;
  }
}
