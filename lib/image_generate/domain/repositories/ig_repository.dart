import '../../data/data_sources/ig_data_source.dart';

abstract class IGRepository {
  Future<String> generateImage(String input);
}

class IGRepositoryImpl implements IGRepository {
  final IGDataSource _dataSource;

  IGRepositoryImpl(this._dataSource);

  @override
  Future<String> generateImage(String input) async {
    return _dataSource.generateImage(input);
  }
}