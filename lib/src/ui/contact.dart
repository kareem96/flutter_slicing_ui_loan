import 'package:flutter/material.dart';
import 'package:slicing_ui/src/data/person_data.dart';
import 'package:slicing_ui/src/model/person_model.dart';

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
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(child: _buildCarousel()),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'My Contact'),
                      Tab(text: 'Other Contact'),
                    ],
                  ),
                ),
              ),
            ];
          },
          // appBar: _buildAppBar(size),
          body: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                children: [
                  _tabMyContact(context),
                  const Center(child: Text('Tab Other Contact')),
                ],
              ),
            ],
          )),
    );
  }
}

Widget _tabMyContact(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Stack(
      children: [
        Column(
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
                )
            )
          ],
        )
      ],
    ),
  );
}

Widget _buildListRestaurant(BuildContext context, PersonModel person){
  return Material(

    child: SizedBox(
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(radius: 30),
          // leading: Hero(tag: person.pictureId, child: Image.network(restaurant.pictureId, fit: BoxFit.fill,width: 100,),),
          title: Text(person.name, style: Theme.of(context).textTheme.bodyText2,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(person.gender),
              Text(person.job),
              Text(person.email),
              Text(person.telp),
            ],
          ),
          onTap: (){
            /*Navigator.pushNamed(context, DetailPage.routeName, arguments: restaurant);*/
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
