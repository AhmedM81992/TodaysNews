import 'package:flutter/material.dart';
import 'package:new_c10_monday/models/source_response.dart';
import 'package:new_c10_monday/shared/styles/my_theme_data.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool selected;

  SourceItem({required this.source, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: MyThemeData.primaryColor),
          color: selected ? MyThemeData.primaryColor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color:
                selected ? MyThemeData.whiteColor : MyThemeData.primaryColor),
      ),
    );
  }
}
