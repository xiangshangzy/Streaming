import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _Header(),
                SizedBox(
                  height: 16,
                ),
                _Category()
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
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          color: Theme.of(context).colorScheme.primary,
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[200]),
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/image/logo-gia-developer.png'),
                  )
                ],
              ),
              Text(
                'What Would you like',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey[100]),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8,),
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
      color: Theme.of(context).colorScheme.surface,
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
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          )),
    );
  }
}

class _Header2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        'Good Morning, Maya',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      GestureDetector(
        onTap: () {},
        child: const SizedBox(
          width: 48,
          height: 48,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image/Cruel-Summer.jpg'),
          ),
        ),
      )
    ]);
  }
}

class _Section extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Special Of Album',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('View all',
                        style: Theme.of(context).textTheme.labelLarge),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 4,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(5, (index) => Text('data')),
        ),
        Row(
          children: [
            // Container(child: Image.asset('assets/image/SeeYouAgain.jpg'))
          ],
        )
      ],
    );
  }
}

class _Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage('assets/image/SeeYouAgain.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 120,
              child: Text(
                'Shatter Me',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 120,
              child: Text(
                '01/01 00:00',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.black.withOpacity(0.6)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }
}
