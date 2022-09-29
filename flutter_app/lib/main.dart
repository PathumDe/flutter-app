import 'package:flutter/material.dart';
import 'package:flutter_app/OrderDetail.dart';
import 'package:flutter_app/myordersmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My orders',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My orders'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static List<String> ordername = ['order1','order2','order3','order4','order5','order6'];

  static List url = [
    'https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80',
    'https://static.toiimg.com/thumb/53096885.cms?width=1200&height=900',
    'https://i0.wp.com/www.eatlanka.com/wp-content/uploads/2021/11/Chocolate-cake-recipe-1200a.jpg',
    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2022%2F03%2F23%2F8095-black-forest-cake-kim-2000.jpg',
    'https://blog.wilton.com/wp-content/uploads/2021/04/bright-and-bold-rosette-cake.jpg',
    'https://www.cakehut.in/image/cache/catalog/2021%20cake%20photos/Double%20Chocolatee-600x600w.jpg.webp'
    ];

  final List<MyordersModel> Orderdata = List.generate(
    ordername.length,
     (index) 
     => MyordersModel('${ordername[index]}', '${url[index]}', '${ordername[index]}'));


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('My orders'),
      ),
      body: ListView.builder(
        itemCount: Orderdata.length,
        itemBuilder: (context,index){
          return Card (
            child: ListTile(
              title: Text(Orderdata[index].name),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.network(Orderdata[index].ImageUrl,
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetail(myordersModel: Orderdata[index],)));
            },
          ),
          );
        }
        )
  
    );
  }
}
