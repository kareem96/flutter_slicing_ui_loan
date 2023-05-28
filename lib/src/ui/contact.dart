import 'package:flutter/material.dart';
import 'package:slicing_ui/src/data/person_data.dart';
import 'package:slicing_ui/src/model/person_model.dart';
import 'package:slicing_ui/src/ui/detail_page.dart';
import 'dart:math' as math;

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverPersistentHeader(
                    pinned: true,
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
                              child: Text(
                                'My Contact',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Other Contact',
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
                  _tabMyContact(context),
                  const Center(
                    child: Text("Tab Other Contact"),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Coming Soon'),
                      duration: Duration(seconds: 2),
                    ),
                  ),
                  child: const Icon(Icons.menu),
                ),
              ),
              Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:  Row(
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
                        child: Icon(Icons.notifications_none),
                      ),
                      const SizedBox(width: 15,),
                      InkWell(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Coming Soon'),
                            duration: Duration(seconds: 2),
                          ),
                        ),
                        child: Icon(Icons.settings),
                      ),
                    ],
                  )
              ),
            ],
          )
        ],
      ),
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

Widget _tabMyContact(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child:
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Cari berdasarkan nama',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () => "",
                  child: Text("Tambah"),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Flexible(
              flex: 9,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: mainList.length,
                  itemBuilder: (context, index) {
                    PersonModel current = mainList[index];
                    return _buildListRestaurant(context, current);
                  }))
        ],
      )
  );
}

Widget _buildListRestaurant(BuildContext context, PersonModel person) {
  return Material(
    child: SizedBox(
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: const CircleAvatar(radius: 30),
          title: Text(
            person.name,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(person.gender),
              Text(person.job),
              Text(person.email),
              Text(person.telp),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, DetailPage.routeName, arguments: person);
          },
        ),
      ),
    ),
  );
}

