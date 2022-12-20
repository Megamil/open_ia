import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_ia/image_generate/domain/repositories/ig_repository.dart';

class IGViewModel extends ChangeNotifier {
  final IGRepository _repository;
  String? _imageUrl;
  String? _errorMessage;
  bool? _loading = false;

  IGViewModel(this._repository);

  String? get imageUrl => _imageUrl;
  String? get errorMessage => _errorMessage;
  bool? get loading => _loading;

  Future<void> generateImage(String input) async {
    try {
      _loading = true;
      notifyListeners();

      _imageUrl = await _repository.generateImage(input);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}