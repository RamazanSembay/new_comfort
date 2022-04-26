import 'package:flutter/material.dart';

class NewAirpodsStructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Құлаққаптар',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff444444),
            fontFamily: 'OpenSans',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff444444),
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xffE6E9EB),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Apple',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff444444),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Text(
                          'Барлығы',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff888888),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AirpodsApple(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Xiaomi',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff444444),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Text(
                          'Барлығы',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff888888),
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AirprodsAirdots(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AirpodsApple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hd3/h7b/46719105990686/apple-airpods-3-belyj-102667744-1.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hd3/h7b/46719105990686/apple-airpods-3-belyj-102667744-1.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/he4/hcf/33518224441374/apple-airpods-max-cernyj-100950846-1-Container.jpg'),
                width: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AirprodsAirdots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h06/h81/49203482165278/xiaomi-redmi-buds-3-lite-cernyj-103306269-1.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h30/h87/48152134418462/xiaomi-redmi-airdots-2-cernyj-103380632-1.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h2f/hb4/48725425192990/xiaomi-redmi-buds-3-pro-seryj-102398960-1-Container.jpg'),
                width: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
