import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/rvrpod.dart';

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

  void onSubmit(WidgetRef ref, String value, int age) {
    // final user = ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateCreds(value, age);
  }

  void onNameSubmit(WidgetRef ref, String value) {
    // final user = ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateName(value);
  }

  void onAgeSubmit(WidgetRef ref, int value) {
    // final user = ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateAge(value);
  }

  // void onChange(WidgetRef ref, String value) {
  //   ref.read(userProvider.notifier).updateName(value);
  //   final age = ref.watch(userProvider).age;
  //   // ref.read(userProvider.notifier).updateCreds(value, age);
  // }

  @override
  Widget build(BuildContext context) {
    var name;
    var age;
    // final user = ref.watch(myProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final user = ref.watch(userProvider);

        // final uName = user.name;
        return Column(
          children: [
            Center(
              child: Text(
                'Hi, ${user.name.toString()}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                onChanged: (value) {
                  name = value;
                  // onNameSubmit(ref, value);
                  // onChange(ref, value);
                },
                // onChanged: (value) => onChange(ref, value),
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(onChanged: (value) {
                age = int.parse(value);
                // onAgeSubmit(ref, int.parse(value));
              }
                  // onChanged: (value) => onSubmit(ref, value),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  onSubmit(ref, name, age);
                },
                child: const Text('Submit')),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Name: ${user.name.toString()}',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Age: ${user.age.toString()}',
              ),
            ),
          ],
        );
      }),
    );
  }
}

// this is a stateless widget that uses consumer widget
class MyStatelessConsumer extends ConsumerWidget {
  const MyStatelessConsumer({super.key});

  // Widget ref is required to communicate with the provider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}

// this is a stateless widget that uses ComnsumerStateful widget
// in place of ConsumerWidget. It also uses the ConsumerState<> instead
// of State<> which contains the WidgetRef Built in.
class MyStatefulConsumer extends ConsumerStatefulWidget {
  const MyStatefulConsumer({super.key});

  @override
  ConsumerState<MyStatefulConsumer> createState() => _MyStatefulConsumerState();
}

class _MyStatefulConsumerState extends ConsumerState<MyStatefulConsumer> {
  // Widget ref is not required to communicate with the provider
  // as the ConsumerState has WidgetRef built in
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
