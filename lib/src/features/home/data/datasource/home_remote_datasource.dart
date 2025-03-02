import '../../../../core/api/api_helper.dart';

sealed class HomeRemoteDataSource {}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  // ignore: unused_field
  final ApiHelper _helper;

  const HomeRemoteDataSourceImpl(this._helper);
}
