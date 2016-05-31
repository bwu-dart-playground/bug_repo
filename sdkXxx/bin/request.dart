import 'dart:async' show Future, Stream;
import 'dart:io' as io;

main() async {
  final List r1 = await _request /*<List<Map<String,dynamic>>>*/ (
      new String.fromEnvironment('xxx') == 'yyy');

  final List<Map<String, dynamic>> r2 =
      await _request /*<List<Map<String,dynamic>>>*/ (
          new String.fromEnvironment('xxx') == 'yyy');

  Container mapf1(Map<String, dynamic> e) => new Container.fromJson(e);
  return r2.map /*<Container>*/ (mapf1);
}

class Container {
  Container.fromJson(Map<String, dynamic> m);
}

Future<dynamic /*=T*/ > _request /*<T>*/ (bool someFlag) async {
  if (someFlag) {
    return new List<Map<String, dynamic>>();
  }
  return null;
}
