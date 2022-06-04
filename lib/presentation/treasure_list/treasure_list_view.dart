import 'package:flutter/material.dart';

import '../common/BorderTextFieldDecoration.dart';
import '../common/ContainerShadowDecoration.dart';
import '../treasure_map/treasure_map_view.dart';

class TreasureListView extends StatefulWidget {
  const TreasureListView({Key? key}) : super(key: key);

  @override
  State<TreasureListView> createState() => _TreasureListViewState();
}

class _TreasureListViewState extends State<TreasureListView> {
  final treasureController = TextEditingController();
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 보물 검색 TextField
            _treasureSearchView(),

            // 필터, 정렬
            _filterViews(),

            // 보물 리스트
            _treasureListView(),
          ],
        ),
      ),
    );
  }

  Padding _treasureSearchView() {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
      child: Container(
        decoration: ContainerShadowDecoration(),
        height: 48,
        child: Row(
          children: [
            // TreasureListButton(),
            Expanded(
              child: TextField(
                controller: treasureController,
                decoration: BorderTextFieldDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _filterViews() {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 13),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _filterDropboxButton(),
            _alignDropboxButton(),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _filterDropboxButton() {
    return DropdownButton(
      // Initial Value
      value: dropdownvalue,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }

  DropdownButton<String> _alignDropboxButton() {
    return DropdownButton(
      // Initial Value
      value: dropdownvalue,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}

class _treasureListView extends StatelessWidget {
  const _treasureListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return _TreasureListCell();
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                height: 4,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TreasureListCell extends StatelessWidget {
  const _TreasureListCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text('ProfileImage'),
        ),
        const SizedBox(width: 8),
        Text('#태그하나 #태그둘 #태그셋'),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: Text('보물 찾기', style: TextStyle(color: Colors.purple),),
          style: _findTreasureButtonStyle(),
        ),
      ],
    );
  }

  ButtonStyle _findTreasureButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
                side: BorderSide(color: Colors.purple))));
  }
}
