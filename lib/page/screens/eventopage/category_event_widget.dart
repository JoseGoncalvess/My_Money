import 'package:flutter/material.dart';
import 'package:my_money/page/widgets/iconcategory_event_widget.dart';

class CategoryEventWidget extends StatefulWidget {
  const CategoryEventWidget({Key? key}) : super(key: key);

  @override
  State<CategoryEventWidget> createState() => _CategoryEventWidgetState();
}

class _CategoryEventWidgetState extends State<CategoryEventWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.2,
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconcategoryEventWidget(
                  onpressed: () {},
                  icon: Icons.luggage_rounded,
                  namecategory: 'Ferias'),
              IconcategoryEventWidget(
                  onpressed: () {},
                  icon: Icons.park_rounded,
                  namecategory: 'lazer'),
              IconcategoryEventWidget(
                  onpressed: () {},
                  icon: Icons.auto_graph_rounded,
                  namecategory: 'Investimento'),
              IconcategoryEventWidget(
                  onpressed: () {}, icon: Icons.group, namecategory: 'Role'),
              IconcategoryEventWidget(
                  onpressed: () {},
                  icon: Icons.flight_rounded,
                  namecategory: 'Viagem'),
              IconcategoryEventWidget(
                  onpressed: () {},
                  icon: Icons.medical_services_rounded,
                  namecategory: 'Saúde'),
              IconcategoryEventWidget(
                  onpressed: () {},
                  icon: Icons.restaurant_rounded,
                  namecategory: 'Alimentação'),
              IconcategoryEventWidget(
                  onpressed: () {}, icon: Icons.work, namecategory: 'Trabalho')
            ],
          ),
        ));
  }
}
