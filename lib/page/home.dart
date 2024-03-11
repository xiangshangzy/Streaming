import 'package:fl_chart/fl_chart.dart';
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
                const SizedBox(
                  height: 16,
                ),
                _StorageUsage()
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
                  const CircleAvatar(
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
              const SizedBox(
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Caption(title: '存储类型'),
        Row(
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
                const SizedBox(
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

class _StorageUsage extends StatelessWidget {
  final sectionData = [
    PieChartSectionData(value: 1, title: '视频', color: Colors.cyanAccent),
    PieChartSectionData(value: 2, title: '音频', color: Colors.lightBlue),
    PieChartSectionData(value: 2, title: '图片', color: Colors.amberAccent),
    PieChartSectionData(value: 3, title: '空闲', color: Colors.lightGreen),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Caption(title: '存储使用'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StorageChart(
              sectionData: sectionData,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: sectionData
                    .map((x) => _StorageIndicator(
                        color: x.color,
                        label: x.title,
                        value: '${x.value.toString()}GB'))
                    .toList()),
          ],
        ),
      ],
    );
  }
}

class _StorageChart extends StatelessWidget {
  final List<PieChartSectionData> sectionData;

  const _StorageChart({required this.sectionData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child:
          PieChart(PieChartData(sections: sectionData, centerSpaceRadius: 40,sectionsSpace:10)),
    );
  }
}

class _StorageIndicator extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _StorageIndicator(
      {required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 8,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _Caption extends StatelessWidget {
  final String title;

  const _Caption({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
