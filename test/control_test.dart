import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'dart:async' as Async;

void main() {
  testWidgets('Control', (WidgetTester tester) async {
    SwiperController controller = new SwiperController(0);

    SwiperPluginConfig config = new SwiperPluginConfig(
        activeIndex: 0,
        controller: controller,
        itemCount: 10,
        loop: true,
        scrollDirection: Axis.horizontal);

    Key key = new UniqueKey();
    await tester.pumpWidget(new MaterialApp(
      home: new Scaffold(body: new Builder(builder: (BuildContext context) {
        return new SwiperControl(key: key).build(context, config);
      })),
    ));

    expect(find.byKey(key), findsOneWidget);

    bool first =true;

    await tester.tap(  find.byWidgetPredicate( ( Widget widget  ){

      if(widget is GestureDetector && first){
        first  =false;
        return true;
      }

      return false;

    }) );





  });
}