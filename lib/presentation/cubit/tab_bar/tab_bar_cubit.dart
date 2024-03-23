import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarCubit extends Cubit<int> {
  TabBarCubit() : super(0);

  void select(int index) => emit(index);
}
