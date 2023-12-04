import 'package:card/utils/color_constants.dart';
import 'package:card/utils/string_constants.dart';
import 'package:card/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = "Install Now";
  List<String> items = ["Install Now", "Installed", "Added", "Open"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Card(
      child: Column(
        children: [
          ListTile(
              tileColor: ColorConstant.black,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              dense: true,
              leading: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.blue, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: IconButton(
                  style: IconButton.styleFrom(
                    // side: const BorderSide(color: Colors.blue, width: 2),
                    iconSize: 50,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.circle),
                  padding: EdgeInsets.zero,
                ),
              ),
              title: const Text(StringConstants.nykaafashion,
                  style: TextStyleConstants.textStyleFont18Weight600),
              subtitle: Text(StringConstants.sponsored,
                  style: TextStyleConstants.textStyleFont18Weight600
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 16)),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Why are you seeing this post"),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      child: Column(
                        children: [
                          Text("Why are you seeing this post"),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      child: Column(
                        children: [
                          Text("Why are you seeing this post"),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                // onTap: () {
                //   log("GestureDetector onTap is tapped...");
                // },
                child: const Icon(
                  Icons.more_vert,
                  color: ColorConstant.white,
                  size: 30,
                ),
              )

              // IconButton(
              //   constraints: BoxConstraints(),
              //   padding: EdgeInsets.zero,
              //   onPressed: (){},
              //   icon: const Icon(Icons.more_vert),
              // ),
              ),
          Image.network(
            "https://img.freepik.com/free-photo/pair-trainers_144627-3799.jpg?size=626&ext=jpg",
            width: MediaQuery.of(context).size.width,
          ),
          ListTile(
            tileColor: Colors.pink,
            trailing: DropdownButton(
              style: TextStyleConstants.textStyleFont18Weight600,
              dropdownColor: Colors.black,
              value: dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: ColorConstant.white,
              ),
              items: items.map(
                (String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),

              onChanged: (newvalue) {
                setState(() {
                  dropdownValue = newvalue ?? "";
                });
              },
              // )
              // trailing: InkWell(
              //   child: Icon(
              //     Icons.arrow_forward_ios,
              //     color: Colors.white,
              //   ),
              // ),
            ),
          ),
          const ListTile(
            tileColor: ColorConstant.black,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Wrap(
              spacing: 15,
              children: [
                InkWell(
                  child: Icon(
                    Icons.favorite_border,
                    color: ColorConstant.white,
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.chat,
                    color: ColorConstant.white,
                  ),
                ),
                InkWell(
                  child:
                      Icon(Icons.favorite_border, color: ColorConstant.white),
                ),
              ],
            ),
            trailing: InkWell(
                child: Icon(
              Icons.bookmark_border,
              color: ColorConstant.white,
              size: 25,
            )),
          ),
        ],
      ),
    );
  }
}
