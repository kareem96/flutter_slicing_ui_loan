import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicing_ui/src/ui/bank.dart';
import 'package:slicing_ui/src/ui/contact.dart';
import 'package:slicing_ui/src/ui/home.dart';
import 'package:slicing_ui/src/ui/loan.dart';
import 'package:slicing_ui/src/ui/product.dart';

class HomeBottomNavIndexBloc extends Cubit<int>{
  HomeBottomNavIndexBloc() : super(0);

  void changeBottomNavIndex(int newIndex) => emit(newIndex);
  List<Widget> pages =[
    HomePage(),
    ContactPage(),
    LoanPage(),
    ProductPage(),
    BankPage(),
  ];
}