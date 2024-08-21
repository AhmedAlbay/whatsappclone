import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                'assets/images/groups.svg',
                height: 37,
                width: 37,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            trailing: Text("18:45"),
            title: Text(
              "Ahmed Mohamed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
