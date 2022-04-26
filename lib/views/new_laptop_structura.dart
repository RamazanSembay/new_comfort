import 'package:flutter/material.dart';

class NewLaptopStructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Ноутбуктер',
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
                    child: LaptopApple(),
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
                          'Lenovo',
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
                    child: LaptopLenovo(),
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
                          'Hp',
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
                    child: LaptopHp(),
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

class LaptopApple extends StatelessWidget {
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
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h54/hd7/33090953773086/apple-macbook-pro-2020-13-3-myd82-seryj-100797630-1-Container.jpg'),
                fit: BoxFit.fill,
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hfd/h54/33286638272542/apple-macbook-air-2020-13-3-mgnd3-zolotistyj-100797576-1-Container.jpg'),
                fit: BoxFit.fill,
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h26/h93/47153374134302/apple-macbook-pro-14-mkgp3-seryj-102866247-1.jpg'),
                fit: BoxFit.fill,
                width: 90,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LaptopLenovo extends StatelessWidget {
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
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h3b/h39/32457190539294/lenovo-legion-y740-17irhg-81uj0069rk-cernyj-100086376-1.jpg'),
                fit: BoxFit.fill,
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h6f/hef/47717124407326/lenovo-ideapad-gaming-3-15ach6-82k200h2rk-102788756-1.jpg'),
                fit: BoxFit.fitHeight,
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h16/hae/34323172524062/lenovo-thinkbook-20ve0006ru-serebristyj-101336270-1.jpg'),
                width: 90,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LaptopHp extends StatelessWidget {
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
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/he6/hf7/47788410142750/hp-elite-dragonfly-g2-336p0ea-sinij-103188402-1.jpg'),
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hdf/h07/48578421162014/hp-zbook-fury-15-g7-119x1ea-seryj-103595375-1.jpg'),
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h73/h6f/49199785541662/hp-laptop-17-ck0007ur-4a753ea-cernyj-104010149-1.jpg'),
                width: 90,
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
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hbc/h5b/34304523173918/oneplus-9-12-256gb-goluboj-101458605-1-Container.jpg'),
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/ha0/hf9/49390419017758/oneplus-nord-ce-2-8-gb-128-gb-serebristyj-104139872-1.jpg'),
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/ha1/he1/48031663357982/oneplus-9r-12-256gb-zelenyj-102383412-1-Container.jpg'),
                width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                image: NetworkImage(
                    'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h90/hb5/47604619214878/oneplus-9rt-8-256gb-cernyj-103085347-1.jpg'),
                width: 90,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
