part of 'drawer_cubit.dart';

enum DrawerType {
  none,
  performance,
  daily,
}

class DrawerState extends Equatable {
  final DrawerType drawerType;
  final bool isPopOut;

  const DrawerState({required this.drawerType, required this.isPopOut});

  factory DrawerState.initial() {
    return DrawerState(drawerType: DrawerType.none, isPopOut: true);
  }

  @override
  List<Object> get props => [drawerType, isPopOut];

  DrawerState copyWith({
    DrawerType? drawerType,
    bool? isPopOut,
  }) {
    return DrawerState(
      drawerType: drawerType ?? this.drawerType,
      isPopOut: isPopOut ?? this.isPopOut,
    );
  }
}
