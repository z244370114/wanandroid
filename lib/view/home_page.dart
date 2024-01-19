import 'package:dio/dio.dart';
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
      body: _NavigationBodyItem(content: _listItemWidget()),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('每日一问'),
      body: _NavigationBodyItem(content: _listItemWidget()),
    ),
    PaneItemHeader(header: Text("专题")),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('面试相关'),
      body: _NavigationBodyItem(content: _listItemWidget()),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('性能优化'),
      body: _NavigationBodyItem(content: _listItemWidget()),
    ),
  ];

  var topIndex = 0;

  var list = ["1", "1"];

  var selectedContact;

  @override
  void initState() {
    super.initState();
    getData();
  }

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

  final dio = Dio();

  getData() async {
    var response = await dio.get(
        'https://www.wanandroid.com/article/list/0/json',
        queryParameters: {"cid": "60"});
    print(response);
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
                  Text("作者"),
                  Text("分类"),
                  Text("时间"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _listItemWidget() {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final contact = list[index];
          return Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Icon(FluentIcons.favorite_star, size: 20),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact,
                        style: FluentTheme.of(context)
                            .typography
                            .title
                            ?.apply(fontSizeFactor: 1.0),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: [
                          Text(
                            "作者",
                            style: FluentTheme.of(context)
                                .typography
                                .bodyStrong
                                ?.apply(fontSizeFactor: 1.0),
                          ),
                          SizedBox(width: 14.0),
                          Text(
                            "分类",
                            style: FluentTheme.of(context)
                                .typography
                                .body
                                ?.apply(fontSizeFactor: 1.0),
                          ),
                          SizedBox(width: 14.0),
                          Text(
                            "时间",
                            style: FluentTheme.of(context)
                                .typography
                                .caption
                                ?.apply(fontSizeFactor: 1.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Icon(FluentIcons.more, size: 20),
                ),
              ],
            ),
          );
        });
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
