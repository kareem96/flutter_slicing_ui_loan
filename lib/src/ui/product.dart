import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            DefaultTabController(
              length: 2,
              child: NestedScrollView(headerSliverBuilder: (context, value) {
                return [
                  SliverPersistentHeader(pinned: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 150,
                        maxHeight: 150,
                        child: Container(
                          color: Colors.blue,
                          height: 195,
                          width: double.infinity,
                          child: const Image(
                            image: AssetImage('assets/image/loan.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 50,
                        maxHeight: 50,
                        child: Container(
                          color: Colors.white,
                          child: TabBar(
                            controller: _tabController,
                            tabs: const [
                              Tab(
                                child: Text('Bank', style: TextStyle(color: Colors.black,),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Developer',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    _tabBank(context),
                    const Center(
                      child: Text("Tab Developer"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Coming Soon'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                      child: const Icon(Icons.menu),
                    ),
                  ),
                  Container(

                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Coming Soon'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: const Icon(Icons.notifications_none),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Coming Soon'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: const Icon(Icons.settings),
                          ),
                        ],
                      )),
                ],
              )
            )
          ],
        )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

Widget _tabBank(BuildContext context) {
  IconData? _selectedIcon;
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items
  ];

  return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: 'Cari nama bank',

              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Coming Soon'),
                                duration: Duration(seconds: 2),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.add), // Icon widget
                                SizedBox(width: 8), // Optional spacing
                                Text('Tambah'), // Button text
                              ],
                            ),
                          )),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Coming Soon'),
                                duration: Duration(seconds: 2),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.sort,
                                  color: Colors.black,
                                ),
                                // Icon widget
                                SizedBox(width: 8),
                                // Optional spacing
                                Text(
                                  'Sort',
                                  style: TextStyle(color: Colors.black),
                                ),
                                // Button text
                              ],
                            ),
                          )),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const TextField(
            enabled: false,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: 'ALL',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 320,
                  child: Card(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        const Image(
                          height: 100,
                          width: 200,
                          image: AssetImage('assets/image/mandiri.png'),
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.green),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Text("Rating:"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBar.builder(
                                        initialRating: 3.0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        itemBuilder: (context, index) => Icon(
                                              _selectedIcon ?? Icons.star,
                                              color: Colors.amber,
                                            ),
                                        onRatingUpdate: (rating) {}),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("14 Reviews:"),
                                  ],
                                ),
                              ),
                            )),
                            const VerticalDivider(
                              width: 10,
                              thickness: 1,
                              indent: 2,
                              endIndent: 2,
                              color: Colors.grey,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(color: Colors.green),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    const Text("User :"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("220:"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("Users yearly:"),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Mandiri",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Bunga Special Tengah Imlek 2023",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.bar_chart),
                                    Text(
                                      "Fix Rate(Year): 3.88",
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.access_time),
                                    Text(
                                      "Max Tenor: 12",
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.access_time),
                                    Text(
                                      "Loan to Value: 1",
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.bar_chart),
                                    Text(
                                      "Fix Rate(Year): 3.88",
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.person_outline_outlined),
                                    Text(
                                      "Target: Karyawan",
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.monetization_on_outlined),
                                    Text(
                                      "Komisi: 1",
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Coming Soon'),
                                    duration: Duration(seconds: 2),
                                  ),
                                ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Detail',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                              ),
                            ))
                      ],
                    ),
                  )),
                );
              },
            ),
          )
        ],
      ));
}
