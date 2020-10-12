import 'package:flutter/material.dart';

import 'base_widgets/container_widget.dart';

class IndexWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemImageCardWidget(
                widgetCategoryName: 'Container',
                categoryDescriptor: '一个拥有绘制、定位、调整大小的 widget。',
                onStart: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ContainerWidgetPage();
                  }));
                },
              ),
              ItemImageCardWidget(
                widgetCategoryName: 'Row',
                categoryDescriptor:
                    '在水平方向上排列子widget的列表。',
              ),
              ItemImageCardWidget(
                widgetCategoryName: 'Column',
                categoryDescriptor: '在垂直方向上排列子widget的列表。',
              ),
              ItemImageCardWidget(
                widgetCategoryName: 'Image',
                categoryDescriptor: '一个显示图片的widget',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemImageCardWidget extends StatelessWidget {
  const ItemImageCardWidget({
    this.widgetCategoryName,
    this.categoryDescriptor,
    this.onStart,
    Key key,
  }) : super(key: key);

  final String widgetCategoryName;
  final String categoryDescriptor;
  final Function onStart;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          onStart();
        },
        child: Container(
          width: 300.0,
          height: 320.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('images/sansansi.jpg'),
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  widgetCategoryName,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  categoryDescriptor,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return IndexWidgets();
                    }));
                  },
                  child: Text(
                    '文档',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
