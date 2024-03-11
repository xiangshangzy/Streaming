import 'package:flutter/material.dart';

class MyResource extends StatelessWidget{
  const MyResource({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.refresh),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                _Caption(),
                const SizedBox(
                  height: 16,
                ),
                _ResourceGrid()
              ],
            )));
  }
}

class _Caption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Home',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            Text(
              '2024-01-01',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w100),
            )
          ],
        )
      ],
    );
  }
}

class _ResourceGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 100,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) => _ResourceItem()),
    );
  }
}

class _ResourceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 3,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 180,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/image/CalmDown.jpg',
                  fit: BoxFit.cover,
                  height: 120,
                  width: 180,
                ),
                SizedBox(height: 8),
                Text(
                  'See You Again',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(overflow: TextOverflow.ellipsis),
                ),

                Opacity(
                  opacity: 0.8,
                  child: Text(
                    'up 2024-01-01',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

