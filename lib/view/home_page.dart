import 'package:fluent_ui/fluent_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<NavigationPaneItem> items = [
    PaneItemHeader(header: Text("推荐")),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('热门博文'),
      body: _NavigationBodyItem(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('每日一问'),
      body: _NavigationBodyItem(),
    ),
    PaneItemHeader(header: Text("专题")),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('面试相关'),
      body: _NavigationBodyItem(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('性能优化'),
      body: _NavigationBodyItem(),
    ),
  ];

  var topIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: topIndex,
        onChanged: (index) => setState(() => topIndex = index),
        displayMode: PaneDisplayMode.auto,
        items: items,
      ),
    );
  }

  Widget _itemWidget() {
    return Container(
      child: Row(
        children: [
          Icon(FluentIcons.favorite_star, size: 40),
          Column(
            children: [
              Text("data"),
              Row(
                children: [

                ],
              )
            ],
          )
        ],
      ),
    );
  }

}

class _NavigationBodyItem extends StatelessWidget {
  const _NavigationBodyItem({
    this.header,
    this.content,
  });

  final String? header;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      // header: PageHeader(title: Text(header ?? 'This is a header text')),
      content: content ?? const SizedBox.shrink(),
    );
  }
}
