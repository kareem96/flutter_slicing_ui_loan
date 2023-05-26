import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicing_ui/src/home_bottom_nav_cubit.dart';


class HomeTab extends StatefulWidget {
  static const String routeName = "/homeTab";

  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBottomNavIndexBloc, int>(
        listener: (context, state) {
      setState(() {
        _tabController.index = state;
      });
    }, builder: (context, selectedIndex) {
      final HomeBottomNavIndexBloc homeBottomNavIndexBloc = context.read();
      return Scaffold(
        body: homeBottomNavIndexBloc.pages[selectedIndex],
        bottomNavigationBar: _buildBottomNav(homeBottomNavIndexBloc),
      );
    });
  }

  Widget _buildBottomNav(HomeBottomNavIndexBloc homeBottomNavIndexBloc) {
    return BottomNavigationBar(
        currentIndex: homeBottomNavIndexBloc.state,
        onTap: (index) {
          if (index == 0) {
            BlocProvider.of<HomeBottomNavIndexBloc>(context)
                .changeBottomNavIndex(0);
          } else if (index == 1) {
            BlocProvider.of<HomeBottomNavIndexBloc>(context)
                .changeBottomNavIndex(1);
          } else if (index == 2) {
            BlocProvider.of<HomeBottomNavIndexBloc>(context)
                .changeBottomNavIndex(2);
          } else if (index == 3) {
            BlocProvider.of<HomeBottomNavIndexBloc>(context)
                .changeBottomNavIndex(3);
          } else if (index == 4) {
            BlocProvider.of<HomeBottomNavIndexBloc>(context)
                .changeBottomNavIndex(4);
          }
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Contact",
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            label: "Loan",
            icon: Icon(Icons.description_outlined),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            label: "Product",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: "Bank",
            icon: Icon(Icons.workspace_premium_outlined),
          )
        ]);
  }
}
