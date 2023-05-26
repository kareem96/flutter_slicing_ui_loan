import 'package:flutter/material.dart';
import 'package:slicing_ui/src/data/person_data.dart';
import 'package:slicing_ui/src/model/person_model.dart';
import 'package:slicing_ui/src/ui/detail_page.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              leading: const Icon(Icons.menu),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.notifications_none_outlined),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/image/loan.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              bottom: TabBar(
                labelColor: Colors.black,
                labelPadding: EdgeInsets.zero,
                controller: _tabController,
                tabs: [
                  for (final t in ["My Contact", "Other Contact"])
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Tab(
                        text: t,
                      ),
                    )
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            // Widget for Tab 1
            Center(child: _tabMyContact(context)),
            // Widget for Tab 2
            const Center(child: Text('Tab Other Contact')),
          ],
        ),
      ),
    );
  }

/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver TabBarView Example'),
            pinned: true,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/loan.jpeg',

              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              tabs: [

                for (final t in [1, 2, 3])
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Tab(
                      text: "tab $t",
                    ),
                  )
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Widget for Tab 1
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),

                // Widget for Tab 2
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blue,
                      margin: EdgeInsets.all(8),
                      child: Center(
                        child: Text('Item $index', style: TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),

                // Widget for Tab 3
                Center(child: Text('Tab 3 Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }*/
}

Widget _tabMyContact(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: TextFormField(
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
          ),
          Flexible(
              flex: 9,
              child: Container(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainList.length,
                    itemBuilder: (context, index) {
                      PersonModel current = mainList[index];
                      return _buildListRestaurant(context, current);
                    }),
              ))
        ],
      ));
}

Widget _buildListRestaurant(BuildContext context, PersonModel person) {
  return Material(
    child: SizedBox(
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(radius: 30),
          // leading: Hero(tag: person.pictureId, child: Image.network(restaurant.pictureId, fit: BoxFit.fill,width: 100,),),
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

Widget _buildCarousel() {
  return SizedBox(
    child: Stack(
      children: const <Widget>[
        Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(Icons.menu),
        ),
        Align(
          alignment: Alignment(0.9, -0.9),
          child: Icon(Icons.settings),
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
            height: 200,
            width: 500,
            image: AssetImage('assets/image/loan.jpeg'),
            fit: BoxFit.fill,
          ),
        )
      ],
    ),
  );
}
