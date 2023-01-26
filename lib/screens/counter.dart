
class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterData(),
      builder: (context, child) {
        return Center(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Counter Page'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You have pushed the button this many times:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Consumer(
                  builder: (context, value, child) {
                    return Text(
                      context.watch<CounterData>().counter.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    );
                  },
                ),
              ],
            ),
            floatingActionButton: MaterialButton(
              height: 70,
              minWidth: 70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.blue,
              onPressed: () {
                context.read<CounterData>().increment();
              },
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CounterData with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  increment() {
    _counter++;
  }

  @override
  notifyListeners();
}
