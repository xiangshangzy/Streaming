import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/file_detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.refresh),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _Banner(),
                    const SizedBox(
                      height: 16,
                    ),
                    _StorageUsage(),
                    const SizedBox(
                      height: 16,
                    ),
                    _Category(),
                    const SizedBox(
                      height: 16,
                    ),
                    _RecentFile()
                  ],
                ))));
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        _BannerItem(
            title: 'Work and Private document',
            serviceName: '免费版',
            totalStorage: '1 GB',
            asset: ImageRaster.megaphone,
            color: Colors.orange),
        _BannerItem(
            title: 'Save Your happy moment',
            serviceName: '标准版',
            totalStorage: '10 GB',
            asset: ImageRaster.rocket,
            color: Colors.blue),
        _BannerItem(
            title: 'Welcome the best content creator',
            serviceName: '商业版',
            totalStorage: '50 GB',
            asset: ImageRaster.boxCoins,
            color: Colors.red),
      ],
      options: CarouselOptions(
          height: 200, enlargeCenterPage: true, enableInfiniteScroll: true),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final String title;
  final String serviceName;
  final String totalStorage;
  final String asset;
  final Color color;

  const _BannerItem(
      {super.key,
      required this.title,
      required this.serviceName,
      required this.totalStorage,
      required this.color,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(.5)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      serviceName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      totalStorage,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: color),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Image.asset(
                asset,
                fit: BoxFit.contain,
                height: 80,
                width: 80,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    final sectionData = [
      PieChartSectionData(
        value: 1,
        title: '视频',
        color: Colors.cyanAccent,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 2,
        title: '音频',
        color: Colors.lightBlueAccent,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 2,
        title: '图片',
        color: Colors.amberAccent,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 2,
        title: '文档',
        color: Colors.tealAccent,
        showTitle: false,
      ),
      PieChartSectionData(
        value: 3,
        title: '空闲',
        showTitle: false,
        color: Theme.of(context).colorScheme.primary,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Caption(title: '存储使用'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _StorageChart(
              sectionData: sectionData,
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
                height: 120,
                width: 200,
                child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 100,
                    ),
                    children: sectionData
                        .map(
                          (x) => _StorageIndicator(
                              color: x.color,
                              label: x.title,
                              value: '${x.value.toString()}GB'),
                        )
                        .toList())),
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
      height: 120,
      width: 120,
      child: PieChart(PieChartData(sections: sectionData)),
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
            '$label $value',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _RecentFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final files = [
      FileDetail('word.docx', 2000, FileType.msWord),
      FileDetail('word.docx', 2000, FileType.msPowerPoint),
      FileDetail('word.docx', 2000, FileType.msExcel),
      FileDetail('word.docx', 2000, FileType.msWord),
      FileDetail('word.docx', 2000, FileType.msWord),
      FileDetail('word.docx', 2000, FileType.msWord),
    ];
    return Column(
      children: [
        _Caption(title: '最近浏览'),
        Column(
          children: files
              .map((x) => _FileListItem(file: x, onPressed: () {}))
              .toList(),
        )
      ],
    );
  }
}

class _FileListItem extends StatelessWidget {
  final FileDetail file;
  final Function() onPressed;

  const _FileListItem({super.key, required this.file, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: file.getFileIcon(),
        title: Text(
          file.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          file.getFileSize(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onPressed,
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.more_vert_outlined),
          tooltip: 'more',
        ),
      ),
    );
  }
}

class _Caption extends StatelessWidget {
  final String title;

  const _Caption({required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
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
      ),
    );
  }
}
