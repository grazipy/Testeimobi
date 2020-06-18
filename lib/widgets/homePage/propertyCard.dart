import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:site_lage/components/colors.dart';
import 'package:site_lage/controllers/page_controller.dart';
import 'package:site_lage/models/property.dart';

class PropertyCard extends StatelessWidget {
  final pageController = GetIt.I.get<CurrentPageController>();
  final Property property;

  PropertyCard({Key key, this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 350,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                property.images[0],
              ),
              fit: BoxFit.fill),
          boxShadow: [
            BoxShadow(blurRadius: 10, offset: Offset(5, 5), color: Colors.grey)
          ]),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                property.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                property.address,
                style: TextStyle(color: LageColors.yellow, fontSize: 20),
              ),
              trailing: Text(
                property.forSale ? "Venda" : "Aluguel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              ),
              onTap: () {
                pageController.setProperty(property);
                pageController.changePage(5);
              },
            ),
          ),
        ),
      ),
    );
  }
}
