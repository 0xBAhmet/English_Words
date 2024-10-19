import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  var height, width;

  List Imagedata = [
    "images/a1.png",
    "images/a2.png",
    "images/b1.png",
    "images/b2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: Colors.indigo),
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ingilizce Kelime Öğren",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Text("Bilemediklerini Tekrar Et !",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.6))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //Burası alt kısımın başladığı yer!
              Container(
                height: height * 0.75,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            context.go('/a1words_page');
                            break;
                          case 1:
                            context.go('/words_page');
                            break;
                          case 2:
                            context.go('/b1words_page');
                            break;
                          case 3:
                            context.go('/b2words_page');
                            break;
                        }

                        //eğer ki index 1 se a1 e yollasın
                        //index 2 se a2 ye yollasın
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6)
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              Imagedata[index],
                              width: 100,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
