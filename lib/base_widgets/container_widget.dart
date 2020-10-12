import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidgetPage extends StatelessWidget {
  static const rainbow = <int>[
    0xffff0000,
    0xffff7f00,
    0xffffff00,
    0xff00ff00,
    0xff00ffff,
    0xff0000ff,
    0xff8B00ff,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetIntroductionWidget(
              widgetFuncDescription: '可用于显示一个指定宽高区域',
              showWidget: Container(
                width: 200.0,
                height: 100.0,
                color: Colors.deepOrangeAccent,
              ),
              propertyDescriptions: [
                '【width】:宽 【int】',
                '【height】:高 【int】',
                '【color】:子组件 【int】',
              ],
            ),
            WidgetIntroductionWidget(
              widgetFuncDescription: '可在区域中放入子组件',
              showWidget: Container(
                width: 280.0,
                height: 180.0,
                decoration: ShapeDecoration(
                    color: Colors.blue, shape: RoundedRectangleBorder()),
                child: Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(40.0),
                  width: 200.0,
                  height: 100.0,
                  color: Colors.grey,
                  child: Icon(Icons.android_outlined),
                ),
              ),
              propertyDescriptions: [
                '【padding】:内边距 【EdgeInsetsGeometry】',
                '【margin】:Container 的外边距 【EdgeInsetsGeometry】',
                '【child】:子组件 【Widget】',
              ],
            ),
            WidgetIntroductionWidget(
              widgetFuncDescription: '可对子组件进行对齐定位',
              showWidget: Container(
                alignment: Alignment.bottomCenter,
                width: 200.0,
                height: 100.0,
                color: Colors.grey,
                child: Icon(Icons.android_outlined),
              ),
              propertyDescriptions: [
                '【alignment】:在Container中对齐定位 【AlignmentGeometry】',
              ],
            ),
            WidgetIntroductionWidget(
              widgetFuncDescription: '可对子组件进行装饰',
              showWidget: Container(
                alignment: Alignment.center,
                width: 200.0,
                height: 100.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: rainbow.map((e) => Color(e)).toList()),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ]),
                child: Text('Container'),
              ),
              propertyDescriptions: [
                '【alignment】:在Container中对齐定位 【AlignmentGeometry】',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetIntroductionWidget extends StatelessWidget {
  WidgetIntroductionWidget(
      {this.widgetFuncDescription, this.showWidget, this.propertyDescriptions});

  final Widget showWidget;
  final List<String> propertyDescriptions;
  final String widgetFuncDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                        color: Colors.blue, shape: CircleBorder()),
                  ),
                  SizedBox(width: 8.0),
                  Text(widgetFuncDescription)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.text_snippet),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.integration_instructions_outlined),
                  SizedBox(
                    width: 8,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8.0),
          showWidget,
          SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: propertyDescriptions.map((e) => Text(e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
