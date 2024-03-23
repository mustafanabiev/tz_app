import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tz_app/core/enum/fetch_status.dart';
import 'package:tz_app/data/datasource/drive_remote_data_source.dart';
import 'package:tz_app/data/model/drive_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.driveRemoteDataSource) : super(HomeState());

  final DriveRemoteDataSource driveRemoteDataSource;

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 8),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // ignore: use_build_context_synchronously
      emit(state.copyWith(date: DateFormat('yyyy-MM-dd').format(picked)));
    }
  }

  Future<void> getDriverData({
    required String departureCity,
    required String destinationCity,
    required String date,
  }) async {
    try {
      emit(state.copyWith(status: FetchStatus.loading));
      final response = await driveRemoteDataSource.getDriveData(
        departureCity: departureCity,
        destinationCity: destinationCity,
        date: date,
      );
      if (response != null) {
        emit(state.copyWith(status: FetchStatus.success, driverData: response));
      } else {
        emit(state.copyWith(status: FetchStatus.error));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
