import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _textFromHtmlEditor =
          prefs.getString('ff_textFromHtmlEditor') ?? _textFromHtmlEditor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _drawer = false;
  bool get drawer => _drawer;
  set drawer(bool _value) {
    _drawer = _value;
  }

  bool _showfulllist = true;
  bool get showfulllist => _showfulllist;
  set showfulllist(bool _value) {
    _showfulllist = _value;
  }

  String _textFromHtmlEditor = '';
  String get textFromHtmlEditor => _textFromHtmlEditor;
  set textFromHtmlEditor(String _value) {
    _textFromHtmlEditor = _value;
    prefs.setString('ff_textFromHtmlEditor', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
