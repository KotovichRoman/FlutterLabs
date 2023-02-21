enum Color { red, yellow, green }

abstract class Shape {
  void draw();
}

class Rectangle extends Shape {
  @override
  void draw() {
    print('Draw rectangle');
  }
}

abstract class Widget {
  void render();
}

class Container extends Widget {
  @override
  void render() {
    print('Renders container');
  }
}

mixin PaintableMixin {
  late Color _color;
  void paint(Color color) {
    _color = color;
  }

  Color get color => _color;
}

class PaintableRect extends Rectangle with PaintableMixin {
  void draw() {
    print('Draw rectangle with color $color');
  }
}

class PaintableContainer extends Container with PaintableMixin {
  void render() {
    print('Render container with color $color');
  }
}

class Lox {
  void main() {
    PaintableRect()
      ..paint(Color.red)
      ..draw();
    PaintableContainer()
      ..paint(Color.yellow)
      ..render();
  }
}
