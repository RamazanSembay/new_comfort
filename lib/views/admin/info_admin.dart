import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoAdmin extends StatelessWidget {
  final String id;
  final String name;
  final String image;

  const InfoAdmin({Key key, this.id, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: Color(0xff444444),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    image,
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff444444),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff444444),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.deepPurple,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Тізімдер',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        List(
                          future: FirebaseFirestore.instance
                              .collection('Менің себетім')
                              .doc(id)
                              .collection('Менің себетім')
                              .snapshots(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('Менің себетім')
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .delete();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Өшіру',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class List extends StatelessWidget {
  final Stream<QuerySnapshot> future;

  const List({Key key, this.future}) : super(key: key);
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
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            data['Картинка'],
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['Название'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data['Количество'].toString() + ' дана',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('Менің себетім')
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .collection('Менің себетім')
                            .doc(data.id)
                            .delete();
                        print(data['Id']);
                      },
                      child: Icon(
                        Icons.delete,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
