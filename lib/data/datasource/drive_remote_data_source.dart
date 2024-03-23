import 'package:dio/dio.dart';
import 'package:tz_app/core/api/api_conts.dart';
import 'package:tz_app/core/exceptions/server_exception.dart';
import 'package:tz_app/data/model/drive_model.dart';

class DriveRemoteDataSource {
  Future<TripsModel?> getDriveData({
    required String departureCity,
    required String destinationCity,
    required String date,
  }) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        ApiConst.api(departureCity, destinationCity, date),
      );
      if (response.statusCode == 200) {
        return TripsModel.fromMap(response.data);
      }
    } on Exception catch (e) {
      throw ServerExc(e.toString());
    }
    return null;
  }
}
