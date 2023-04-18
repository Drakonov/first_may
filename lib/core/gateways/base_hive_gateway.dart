import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

abstract class BaseHiveGateway<T> {
  BaseHiveGateway(this._box);

  final Box<T> _box;

  Future<T?> get(dynamic id) async {
    if (_boxIsClosed) {
      return null;
    }
    return _box.get(id);
  }

  Future<List<T>> getAll() async {
    if (_boxIsClosed) {
      return [];
    }
    return _box.values.toList();
  }

  Future<T?> getFirst() async {
    if (_boxIsClosed || _box.isEmpty) {
      return null;
    }
    return _box.values.first;
  }

  Future clear() async {
    await _box.clear();
  }

  T? getFirstWhere(bool Function(T element) where) {
    if (_boxIsClosed) {
      return null;
    }
    return _box.values.firstWhereOrNull(where);
  }

  Future<void> add(T object) async {
    if (_boxIsClosed) {
      return;
    }

    await _box.add(object);
  }

  Future<void> addAll(List<T> objects) async {
    if (_boxIsClosed) {
      return;
    }

    await _box.addAll(objects);
  }

  Future<void> putAt(int index, T object) async {
    if (_boxIsClosed) {
      return;
    }

    await _box.putAt(index, object);
  }

  Future<void> put(T object, dynamic key) async {
    if (_boxIsClosed) {
      return;
    }

    await _box.put(key, object);
  }

  Future<void> deleteAll(Iterable<dynamic> keys) async {
    if (_boxIsClosed) {
      return;
    }

    await _box.deleteAll(keys);
  }

  Future<void> updateWhere(bool Function(T? element) where, T newValue) async {
    if (_boxIsClosed) {
      return;
    }
    List<int> indices = List.empty(growable: true);
    for (int index = 0; index < _box.values.length; index++) {
      if (where(_box.getAt(index))) {
        indices.add(index);
      }
    }
    for (var index in indices) {
      await _box.putAt(index, newValue);
    }
  }

  Future<void> removeWhere(bool Function(T? element, int index) where) async {
    if (_boxIsClosed) {
      return;
    }
    List<int> indices = List.empty(growable: true);
    for (int index = 0; index < _box.values.length; index++) {
      if (where(_box.getAt(index), index)) {
        indices.add(index);
      }
    }
    for (var index in indices) {
      await _box.deleteAt(index);
    }
  }

  bool get _boxIsClosed => !(_box.isOpen ?? false);
}
