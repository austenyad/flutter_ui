import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LifeCycleFlutterStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LifeCycleTopWidget(),
    );
  }
}

class LifeCycleTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter widget 生命周期'),
      ),
      body: Column(
        children: [RoutePage(), PageDetailPage()],
      ),
    );
  }
}

class PageDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 500,
      child: Column(
        children: [
          Image.asset('images/widget_state_lifecycle.png'),
          Text('''创建：
          State 初始化时会依次执行：构造方法 -> initState -> didChangeDependencies -> build，随后完成页面渲染'''),
          Text('''更新：
          Widget 的状态更新，主要由 3 个方法触发： setState、didChangeDependencies 与 didUpdateWidget'''),
          Text('''销毁：
          组件销毁相对比较简单。比如组件被移除，或页面销毁的时候，系统会调用 deactivate 和 dispose 这两个方法，来移除或销毁组件''')
        ],
      ),
    );
  }
}

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  _RoutePageState() {
    print('_RoutePageState: 构造方法');
  }

  @override
  void initState() {
    super.initState();
    print('_RoutePageState: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_RoutePageState: didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('_RoutePageState: build');
    return Container(
      color: Colors.red,
      height: 50,
      width: double.infinity,
      child: Center(
        child: Text(
          'StatefulWidget',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant RoutePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_RoutePageState: didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('_RoutePageState: deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('_RoutePageState: dispose');
  }
}
