import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_comfort/views/admin/info_admin.dart';

class NewAdminStructura extends StatefulWidget {
  @override
  State<NewAdminStructura> createState() => _NewAdminStructuraState();
}

class _NewAdminStructuraState extends State<NewAdminStructura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F4F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Басты бет
            Home_Page(),

            // Тіркелгендер
            Registered_Users(),

            // Тапсырыс бергендер
            Ordered_By(),

            // Sized
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// Басты бет
class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Басты бет
        const Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Text(
            'Басты бет',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff444444),
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Divider(
            thickness: 2,
            color: Color(0xffCCCCCC),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            'Бақылау тақтасы',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff444444),
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            children: [
              Container(
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                  color: Color(0xffEBFDEE),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   '100',
                        //   style: TextStyle(
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.bold,
                        //     color: Color(0xff444444),
                        //     fontFamily: 'OpenSans',
                        //   ),
                        // ),
                        Count(
                          future: FirebaseFirestore.instance
                              .collection('Users')
                              .get(),
                        ),
                        Text(
                          'Тіркелгендер',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff444444),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                  color: Color(0xffE8F0FB),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Count(
                          future: FirebaseFirestore.instance
                              .collection('Менің себетім')
                              .get(),
                        ),
                        Text(
                          'Тапсырыс бергендер',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff444444),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Тіркелгендер
class Registered_Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Тіркелгендер
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            'Тіркелгендер',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff444444),
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(
            thickness: 2,
            color: Color(0xffCCCCCC),
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TestHome(
                future:
                    FirebaseFirestore.instance.collection('Users').snapshots(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Тапсырыс бергендер
class Ordered_By extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Text(
            'Тапсырыс бергендер',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff444444),
              fontFamily: 'OpenSans',
            ),
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TestHome(
                future: FirebaseFirestore.instance
                    .collection('Менің себетім')
                    .snapshots(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Количество
class Count extends StatelessWidget {
  final Future<QuerySnapshot> future;

  const Count({Key key, this.future}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return Text(
          '${snapshot.data?.size}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff444444),
            fontFamily: 'OpenSans',
          ),
        );
      },
    );
  }
}

// Контайнер
class TestHome extends StatelessWidget {
  final Stream<QuerySnapshot> future;

  const TestHome({Key key, this.future}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: future,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.size,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var data = snapshot.data.docs[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  Get.to(InfoAdmin(
                    id: data['Id'],
                    name: data['FullName'],
                    image: data['Img'],
                  ));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff777777),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      // color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 34.0,
                                  width: 34.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.network(
                                      data['Img'],
                                      height: 34.0,
                                      width: 34.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data['FullName'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff444444),
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data['City'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff777777),
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
