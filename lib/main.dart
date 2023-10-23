import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final primaryColor = Colors;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColorDark: Colors.black87,
          scaffoldBackgroundColor: Colors.black54,
          appBarTheme: const AppBarTheme(color: Colors.black54)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          dividerColor: Colors.white30,
          listTileTheme: const ListTileThemeData(iconColor: Colors.white60),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
              labelSmall: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          useMaterial3: false),
      routes: {
        '/myHome': (context) => const MyHomePage(),
        '/coin': (context) => const CoinScreen()
      },
      initialRoute: '/myHome',
      //   home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child:
                  Text("Cripto Bitcoin", style: theme.textTheme.bodyMedium))),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, i) => const Divider(),
          itemBuilder: (context, i) => ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/bitcoin.png',
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                title: Text(
                  "Bitcoin",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  "2000\$",
                  style: theme.textTheme.labelSmall,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/coin');
                },
              )),
    );
  }
}

class CoinScreen extends StatelessWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bitcoin",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Center(child: Text('Hello')),
    );
  }
}
