import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
class Page8 extends StatefulWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> with SingleTickerProviderStateMixin{
late AnimationController _controller;
late Animation _myAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync:
    this,duration: Duration(milliseconds: 5000));
  _controller.addListener(() { });
  _controller.addStatusListener((status) {
  if (status==AnimationStatus.completed){
    _controller.reverse();

  }else if (status==AnimationStatus.dismissed){
    _controller.forward();
  }
  });
  _controller.forward();
 _myAnimation= Tween<double>(
    begin: 0,
    end: 300,
  ).animate(
  CurvedAnimation(
      parent:_controller,
      curve:Curves.bounceInOut));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(
          child: Text("AbdullohPro"),
        ),
      ),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    AnimatedBuilder(animation: _myAnimation, builder:(_,child){
    return Center(
      child: Container(
        width: 200,
        padding: EdgeInsets.only(top: _myAnimation.value),
    child: Image.asset(
    "assets/images/Picture2.png",width: 200,),
    ));
    }
    )],
),
    );
  }
}
