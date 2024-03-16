import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lorem_ipsum_generator/lorem_ipsum_generator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  var name = 'Kitty';
  bool _followed = false;
  var followData = ['Follow', 'Unfollow'];
  String curFollowMessage = '';
  var followMessages = ['Thanks for following!', 'Well, bye :('];
  var birthDate = '${Random().nextInt(27)+1}.${Random().nextInt(2)+10}.${Random().nextInt(5)+2003}\n';
  String testArticle = LoremIpsumGenerator.generate(words: 15);
  var postDate = DateTime.now();

  void _followAction() {
    setState(() {
      _followed = !_followed;
      curFollowMessage = followMessages[_followed ? 0 : 1];
    });
  }

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ]
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.network('https://picsum.photos/250?image=9'),
                      // const Image(
                      //     height: 300,
                      //     image: AssetImage('images/cat.jpg')
                      // ),
                      Image.asset(
                        'assets/images/cat.jpg',
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        // statesController: statesController,
                        // style: widget.style,
                        onPressed: _followAction,
                        child: Text(
                            followData[_followed ? 1 : 0]
                        ),
                      ),
                      Text(
                        curFollowMessage,
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Personal information:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('Some public personal information\n'),
                      const Text(
                        'Date of Birth:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        birthDate,
                      ),
                      const Text(
                        'About me:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('I\'m superrr cuuute and didn\'t sleep enough\n'),
                      const Text(
                        'Fav icon:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.heart_broken),
                      const Text(''),
                      // Text(
                      //   '$_counter',
                      //   style: Theme.of(context).textTheme.headlineMedium,
                      // ),
                    ],
                  )
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name:',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        testArticle,
                        // softWrap: true,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\n${postDate}',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.withOpacity(1.0)),
                      ),
                      // Expanded(
                      //   child:
                      //   Text(testArticle),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
