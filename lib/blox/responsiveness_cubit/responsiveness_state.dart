part of 'responsiveness_cubit.dart';

enum ScreenType {
  none,
  desktop,
  largeTablet,
  smallTablet,
  miniTablet,
  mobile,
}

class ResponsivenessState extends Equatable {
  final ScreenType screenType;

  const ResponsivenessState({required this.screenType});

  factory ResponsivenessState.initial() {
    return ResponsivenessState(
      screenType: ScreenType.none,
    );
  }

  @override
  List<Object> get props => [screenType];

  ResponsivenessState copyWith({
    ScreenType? screenType,
  }) {
    return ResponsivenessState(
      screenType: screenType ?? this.screenType,
    );
  }
}
