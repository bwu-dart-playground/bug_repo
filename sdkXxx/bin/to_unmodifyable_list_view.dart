import 'dart:collection';

void main() {}

class SomeClass {
  List<String> _capDrop;
  List<String> get capDrop => _toUnmodifiableListView /*<String>*/ (_capDrop);

  UnmodifiableListView<String> _args;
  SomeClass.fromJson(Map json) {
    _capDrop = _toUnmodifiableListView /*<String>*/ (_capDrop);
  }
}

UnmodifiableListView<dynamic /*=T*/ > _toUnmodifiableListView /*<T>*/ (
    Iterable list) {
  if (list == null) {
    return null;
  }
  if (list.length == 0) {
    return new UnmodifiableListView<dynamic /*=T*/ >(const []);
  }

  return new UnmodifiableListView<dynamic /*=T*/ >(
      list.map /*<T>*/ ((dynamic e) {
    if (e is Map) {
      return _toUnmodifiableMapView(e) as dynamic /*=T*/;
    } else if (e is List) {
      return _toUnmodifiableListView /*<T>*/ (e);
    } else {
      return e;
    }
  }));
}

UnmodifiableMapView<dynamic /*=K*/,
    dynamic /*=V*/ > _toUnmodifiableMapView /*<K,V>*/ (
    Map<dynamic /*=K*/, dynamic /*=V*/ > map) {
  if (map == null) {
    return null;
  }
  return new UnmodifiableMapView<dynamic /*=K*/, dynamic /*=V*/ >(
      new Map<dynamic /*=K*/, dynamic /*=V*/ >.fromIterable(map.keys,
          key: (dynamic /*=K*/ k) => k, value: (/*=V*/ k) {
    if (map == null) {
      return null;
    }
    if (map[k] is Map) {
      return _toUnmodifiableMapView(map[k]);
    } else if (map[k] is List) {
      return _toUnmodifiableListView(map[k]);
    } else {
      return map[k] as UnmodifiableMapView;
    }
  }));
}
