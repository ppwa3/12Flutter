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
  //나중에 초기화 될것임을 명시하여 데이터로 사용할 List선언
  late List<Person> persons;

  /*
  위젯 초기화시 딱 한번만 호출되는 함수로 State(상태)를 초기화한다.
  단 코드 변경시 Hot reload가 지원되지 않으므로 반드시 재시작해야한다.
   */
  @override
  void initState() {
    super.initState();
    //데이터 초기화
    persons = [];
    //15개의 Person 인스턴스를 추가
    for (int i=0; i<15; i++) {
      persons.add(Person(i+21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:

      /*
      2. ListView.builder를 사용해서 Lazy하게 타일을 생성한다.
      타일 전체를 한꺼번에 생성하지 않으므로 메모리가 절약되고, 속도도
      빨라진다. */
        ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: persons.length,
          itemBuilder: (BuildContext context, int index) {
            return PersonTile(persons[index]);
          }
        ),
    );
  }
  
  List<Widget> getMyList() {

    List<Widget> myList = [];
    for (int i=0; i<persons.length; i++) {
      PersonTile personTile = new PersonTile(persons[i]);
      myList.add(personTile);
    }

    return myList;
  }
}

// 데이터로 사용할 DTO 클래스 =============================================
class Person {
  //멤버변수
  int age;
  String name;
  bool isLeftHandd;
  //생성자 : 각 멤버변수를 초기화하는 축약형 표현방식
  Person(this.age, this.name, this.isLeftHandd);
}
// PersonTile 정의 =====================================================
//리스트뷰를 구성할 타일 클래스 정의
class PersonTile extends StatelessWidget {
  //멤버 변수와 생성자 정의
  final Person _person;

  PersonTile(this._person);

  //여기서 출력할 타일을 생성한다.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text("${_person.age}세"),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        print(_person.name);
      },
    );
  }
}
