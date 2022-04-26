import 'package:flutter/material.dart';

class NewPhoneStructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Телефондар',
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
                    child: PhoneApple(),
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
                          'Samsung',
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
                    child: PhoneSamsung(),
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
                          'Realme',
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
                    child: PhoneRealme(),
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
                          'OnePlus',
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
                    child: PhoneOnePlus(),
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

class PhoneApple extends StatelessWidget {
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
                    'https://alser.kz/products/smartfony-apple//OyqZBimYl/smartfon-apple-iphone-13-pro-max-256-gb-silver-mlmd3rka.png'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-apple//9Xr1oCQx0/smartfon-iphone-12-128gb-black.png'),
                width: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-apple//9XNEksWo0o/smartfon-apple-iphone-13-128gb-starlight.png'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-apple//JyOdmH1kQ/smartfon-apple-iphone-13-128gb-blue.png'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-apple//GaeNkHYEV/smartfon-iphone12-128gb-purple-520x325.png'),
                width: 60,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PhoneSamsung extends StatelessWidget {
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
                    'https://alser.kz/products/smartfony-samsung//gk8wOIoxM/novyj-smartfon-samsung-plus-128gb-green-520x325.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-samsung//veO8jF1Z7R/novyj-smartfon-samsung-512gb-burgundy-1040x650.png'),
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-samsung//oj54wCXY5/smartfon-samsung-galaxy-s21-fe-128gb-green-sm-g990blgdskz-520x325.png'),
                width: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-samsung//vjkxrTPnO/smartfon-samsung-galaxy-a52-256gb-bluesm-a525fzbiskz-1040x650.png'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://alser.kz/products/smartfony-samsung//OybqqC4Ga/smartfon-samsung-galaxy-z-fold-3-512gb-phantom-black-sm-f926bzkgskz-520x325.png'),
                width: 55,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PhoneRealme extends StatelessWidget {
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
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h23/h17/48493559480350/smartfon-realme-9i-6-128gb-blue-103552388-1.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h50/hc2/48493546995742/smartfon-realme-9i-6-128gb-black-103552329-1.jpg'),
                width: 65,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/he8/hfb/45477259149342/realme-c21y-global-4-64gb-goluboj-102274080-1.jpg'),
                width: 65,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hc5/hd8/34091230494750/realme-c11-2021-2-32gb-seryj-101662825-2.jpg'),
                width: 55,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hdd/h0a/48575875514398/realme-c25y-4-gb-128-gb-seryj-103594083-5.jpg'),
                width: 60,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PhoneOnePlus extends StatelessWidget {
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
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hc5/h77/44740094394398/oneplus-nord-2-5g-8-128gb-seryj-102105922-1-Container.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hbc/h5b/34304523173918/oneplus-9-12-256gb-goluboj-101458605-1-Container.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/ha0/hf9/49390419017758/oneplus-nord-ce-2-8-gb-128-gb-serebristyj-104139872-1.jpg'),
                width: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/ha1/he1/48031663357982/oneplus-9r-12-256gb-zelenyj-102383412-1-Container.jpg'),
                width: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h90/hb5/47604619214878/oneplus-9rt-8-256gb-cernyj-103085347-1.jpg'),
                width: 65,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
