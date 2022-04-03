import 'package:dualites_new/page/onboarding_page/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingPage extends StatefulWidget {

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 6.0,
      width: isCurrentPage ? 20.0 : 6.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: slideIndex==0 ? Colors.orange : slideIndex==1 ? Colors.pinkAccent : Colors.lightBlueAccent,
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        slideIndex = index;
                      });
                    },
                    children: <Widget>[
                      SlideTile(
                        color: Colors.orange,
                        imagePath: mySLides[0].imagePath,
                        title: mySLides[0].title,
                        desc: mySLides[0].desc,
                      ),
                      SlideTile(
                        color: Colors.pinkAccent,
                        imagePath: mySLides[1].imagePath,
                        title: mySLides[1].title,
                        desc: mySLides[1].desc,
                      ),
                      SlideTile(
                        color: Colors.lightBlueAccent,
                        imagePath: mySLides[2].imagePath,
                        title: mySLides[2].title,
                        desc: mySLides[2].desc,
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 150,
                  left: 150,
                  child: Container(
                    child: Row(
                      children: [
                        for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                      ],),
                  ),
                ),
                slideIndex!=2 ? Positioned(
                  bottom: 50,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            controller.animateToPage(2, duration: Duration(milliseconds: 200),
                                curve: Curves.linear);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                            ), //Text
                          ),
                        ),
                        SizedBox(width: 230,),
                        GestureDetector(
                          onTap: (){
                            controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 200),
                                curve: Curves.linear);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                            ), //Text
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : Positioned(
                  bottom: 20,
                      left: 10,
                      child: InkWell(
                  onTap: (){
                      print("Get Started");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width-20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                      ),
                      margin: EdgeInsets.symmetric(vertical: 45),
                      height: 60,
                      // color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text(
                        "GET STARTED NOW",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                  ),),
                    )

              ],
            ),
          ],
        ),

      ),
    );
  }
}

class SlideTile extends StatelessWidget {

  String imagePath, title, desc;
  Color color;
  SlideTile({required this.imagePath, required this.title, required this.desc, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 250),
            SizedBox(height: 40,),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
            SizedBox(height: 20,),
            Text(desc, style: TextStyle(color: Colors.white, fontSize: 15),),
          ],
        ),
    );
  }
}
