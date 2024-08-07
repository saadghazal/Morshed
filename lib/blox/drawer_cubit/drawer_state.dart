part of 'drawer_cubit.dart';

enum DrawerType {
  none,
  performance,
  daily,
}

class DrawerState extends Equatable {
  final DrawerType drawerType;

  const DrawerState({required this.drawerType});

  factory DrawerState.initial() {
    return DrawerState(drawerType: DrawerType.none);
  }

  @override
  List<Object> get props => [drawerType];

  DrawerState copyWith({
    DrawerType? drawerType,
  }) {
    return DrawerState(
      drawerType: drawerType ?? this.drawerType,
    );
  }
}
