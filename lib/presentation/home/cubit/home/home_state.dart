part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.status = FetchStatus.loading,
    this.date,
    this.driverData,
  });

  final FetchStatus? status;
  final String? date;
  final TripsModel? driverData;

  HomeState copyWith({
    FetchStatus? status,
    String? date,
    TripsModel? driverData,
  }) {
    return HomeState(
      status: status ?? this.status,
      date: date ?? this.date,
      driverData: driverData ?? this.driverData,
    );
  }
}
