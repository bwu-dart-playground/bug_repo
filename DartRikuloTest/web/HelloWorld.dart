//Sample Code: Hello World!
import 'package:rikulo_ui/view.dart';
import 'dart:js' as js;
void main() {
  js.context.callMethod("alert",["Hello"]);
  final welcome = new TextView("Hello World!");
  welcome.profile.location = "center center";
  welcome.on.click.listen((event) {
    welcome.text = "Hi, this is Rikulo.";
    welcome.style.border = welcome.style.border.isEmpty ? "1px solid blue": "";
    welcome.requestLayout(); //need to re-layout since its size is changed
  });
  welcome.addToDocument();
}
