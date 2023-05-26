import 'package:equatable/equatable.dart';

enum NavBarItem { home, contact, loan, product, bank }

class HomeBottomNavState extends Equatable {
  final NavBarItem navBarItem;
  final int index;

  HomeBottomNavState(this.navBarItem, this.index);

  @override
  // TODO: implement props
  List<Object?> get props => [navBarItem, index];
}
