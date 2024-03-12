import 'package:flutter/material.dart';

class MyResource extends StatelessWidget {
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
              mainAxisExtent: 210,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) => _FileItem()),
    );
  }
}

class _FileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Ink.image(
              image: const AssetImage(
                'assets/images/CalmDown.jpg',
              ),
              fit: BoxFit.cover,
              height: 120,
              width: 180,
            ),
            const ListTile(
              title: Text(
                'See You Again',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('30days before',
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              contentPadding: EdgeInsets.all(0),
            )
          ],
        ),
      ),
    ));
  }
}
