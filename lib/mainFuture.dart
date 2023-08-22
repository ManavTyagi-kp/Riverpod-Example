import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/futureProvider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Consumer(builder: (context, ref, child) {
        return ref.watch(fetchUserProvider).when(
          data: (data) {
            return Scaffold(
              body: Column(
                children: [
                  Center(
                    child: Text(data.name),
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      }),
    );
  }
}
