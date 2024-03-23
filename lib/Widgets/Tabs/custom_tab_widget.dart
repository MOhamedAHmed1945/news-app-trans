// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_news/Models/sourse_response.dart';
import 'package:flutter_application_news/Widgets/Tabs/News%20Widgets/custom_news_widget.dart';
import 'package:flutter_application_news/Widgets/Tabs/News%20Widgets/custom_tab_item.dart';
class CustomTabWidget extends StatefulWidget {
  CustomTabWidget({super.key, required this.sourceList});
  List<Source> sourceList;
  @override
  State<CustomTabWidget> createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
               setState(() {});
              },
              tabs: widget.sourceList
                  .map(
                    (source) => CustomTabItem(
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                      source: source,
                    ),
                  ) 
                  .toList(),
            ),
        Expanded(child: CustomNewsWidget(source: widget.sourceList[selectedIndex],)),
          ],
        ));
  }
}
