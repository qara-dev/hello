import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SafeEnsureVisibleExample extends StatefulWidget {
  const SafeEnsureVisibleExample({super.key});

  @override
  State<SafeEnsureVisibleExample> createState() =>
      _SafeEnsureVisibleExampleState();
}

class _SafeEnsureVisibleExampleState extends State<SafeEnsureVisibleExample> {
  final List<GlobalKey> sectionKeys = List.generate(10, (index) => GlobalKey());
  int currentCategory = 0;

  void scrollToCategory(int index) {
    if (kDebugMode) print('index is $index');

    if (index >= 0 && index < sectionKeys.length) {
      final context = sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void goToPreviousCategory() {
    if (currentCategory > 0) {
      scrollToCategory(--currentCategory);
    }
  }

  void goToNextCategory() {
    if (currentCategory < sectionKeys.length - 1) {
      scrollToCategory(++currentCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safe EnsureVisible Example')),
      bottomNavigationBar: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: goToPreviousCategory,
                icon: const Icon(Icons.arrow_back),
              ),
              Text('Menu', style: Theme.of(context).textTheme.titleMedium),
              IconButton(
                onPressed: goToNextCategory,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Container(
            key: sectionKeys[index],
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // Category Title
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Category ${index + 1}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                // Random Product List
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Random().nextInt(6) + 3,
                  itemBuilder: (context, productIndex) {
                    return ListTile(
                      title: Text(
                        'Product ${productIndex + 1}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) =>
                          Divider(color: Colors.grey.shade300, height: 1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
