import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutterr기본형'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //위젯들은 수평방향으로 배치할때 사용하는 레이아웃 위젯
      //수직 방향일때는 Column 사용
      body: Row(
        //자식 위젯을 2개 이상 배치하는 경우 children 속성 사용
        // <Widget>은 생략 가능함
          children: const [
            Icon(
              Icons.camera_alt,
              color: Colors.blue,
              size: 35.0,
            ),
            Icon(
              Icons.casino,
              color: Colors.red,
              size: 35.0,
            ),
            Icon(
              Icons.child_care,
              color: Colors.green,
              size: 35.0,
            ),
          ],
        ), 
    );
  }
}
