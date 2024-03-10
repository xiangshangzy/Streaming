import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                _Header(),
                const SizedBox(
                  height: 16,
                ),
                _Category(),
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

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          color: Theme
              .of(context)
              .colorScheme
              .primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Alice',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[200]),
                  ),
                  const CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/image/logo-gia-developer.png'),
                  )
                ],
              ),
              Text(
                'What Would you like',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey[100]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                    hintText: 'Search Media File',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true),
              )
            ],
          ),
        ));
  }
}

class _Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Storage Category',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CategoryButton(
              icon: Icons.video_camera_back,
              text: 'Video',
            ),
            _CategoryButton(
              icon: Icons.account_box,
              text: 'Music',
            ),
            _CategoryButton(
              icon: Icons.image,
              text: 'Picture',
            ),
            _CategoryButton(
              icon: Icons.picture_as_pdf,
              text: 'Pdf',
            ),
          ],
        )
      ],
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CategoryButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      color: Theme
          .of(context)
          .colorScheme
          .surface,
      child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 80,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 36,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  text,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                )
              ],
            ),
          )),
    );
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
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        Row(
          children: [
            Text(
              '2024-01-01',
              style: Theme
                  .of(context)
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
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              mainAxisExtent: 180,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => _ResourceItem()),
    );
  }
}

class _ResourceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ink.image(
                  image: AssetImage('assets/image/CalmDown.jpg'),
                  fit: BoxFit.cover,
                  height: 100,
                  width: 120,
                ),
                Text(
                  'See You Again',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(overflow: TextOverflow.visible),
                ),
                Opacity(opacity: 0.6, child: Text(
                  'up 2024-01-01',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(overflow: TextOverflow.visible),
                ) ,),

              ],
            )));
  }
}
