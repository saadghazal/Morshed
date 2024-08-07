import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'responsiveness_state.dart';

class ResponsivenessCubit extends Cubit<ResponsivenessState> {
  ResponsivenessCubit() : super(ResponsivenessState.initial());

  setDeviceType(ScreenType deviceType) {
    emit(state.copyWith(screenType: deviceType));
  }
}
