import 'package:flutter/material.dart';
import 'package:instagram/Model/ProfilePage.dart';
import 'package:instagram/Navigation/routes_name.dart';

class Grid extends StatelessWidget {
   Grid({ super.key,required this.gallery});

  List<Gallery>? gallery;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(5),
      itemCount: gallery!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, RoutesName.postscreen);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(gallery![index].image ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
