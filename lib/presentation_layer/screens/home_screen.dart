import 'package:flutter/material.dart';

import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/presentation_layer/widgets/appbar_widget.dart';

import 'package:home_slice/presentation_layer/widgets/drawer_widget.dart';
import 'package:home_slice/presentation_layer/widgets/pizza_types_container_widger.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: BuildAppBar(
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Eat Fresh Pizza',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myNavyBlue),
                ),
                const Text(
                  'Our daily fresh pizza',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              PizzaTypesContainer(
                                  buttonText: 'Show Now',
                                  onPressed: () {},
                                  category: 'Four Cheese Pizza',
                                  descText:
                                      'A collection of best tasting pizza and most popular one',
                                  image:
                                      'https://pizzamiamiami.com/wp-content/uploads/2020/07/four-cheese.png',
                                  color: MyColors.myYellow,
                                  height: 350),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  PizzaTypesContainer(
                                      buttonText: 'Show Now',
                                      onPressed: () {},
                                      category: 'BBQ Chicken Pizza',
                                      descText:
                                          'A collection of best tasting pizza and most popular one',
                                      color: MyColors.myAlabaster,
                                      height: 370,
                                      image:
                                          'https://t3.ftcdn.net/jpg/06/09/87/68/240_F_609876883_b38hf8FSuAJq9U5L0nkVD3zpmoCce2T6.png'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PizzaTypesContainer(
                                      buttonText: 'Show Now',
                                      onPressed: () {},
                                      category: 'Vegetarian Pizza',
                                      descText:
                                          'A collection of best tasting pizza and most popular one',
                                      color: MyColors.myLightGreen,
                                      height: 350,
                                      image:
                                          'https://t3.ftcdn.net/jpg/06/32/67/10/240_F_632671029_6O9QAth8xN31O5RFCzFndMuFoNHMUHSa.png')
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 165,
                              decoration: BoxDecoration(
                                  color: MyColors.myPink,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/R.f89d76a009947503610ad2be5fa1b8ab?rik=QpEdbmcQdjRwLg&riu=http%3a%2f%2fgoodtucker.com.au%2fwp-content%2fuploads%2f2018%2f08%2fPASTRY-CHEF-FOOTER-IMAGE-CROPPED.png&ehk=zjY%2bcSbDaSssoFPCCR7RTplY2bZn8dCwnCfbftXX%2bIM%3d&risl=&pid=ImgRaw&r=0')),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            PizzaTypesContainer(
                                buttonText: 'Show Now',
                                onPressed: () {},
                                category: 'Pepperoni Pizza',
                                descText:
                                    'A collection of best tasting pizza and most popular one',
                                color: MyColors.myVeryPaleBlue,
                                height: 350,
                                image:
                                    'https://pngimg.com/uploads/pizza/small/pizza_PNG43991.png'),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                PizzaTypesContainer(
                                    buttonText: 'Show Now',
                                    onPressed: () {},
                                    category: 'Hawaiian Pizza',
                                    descText:
                                        'A collection of best tasting pizza and most popular one',
                                    color: MyColors.myWater,
                                    height: 335,
                                    image:
                                        'https://t3.ftcdn.net/jpg/06/09/87/68/240_F_609876893_jirWEbVuSMvlrWeYy1w3mMVjoE3apaMS.png'),
                                const SizedBox(
                                  height: 20,
                                ),
                                PizzaTypesContainer(
                                    buttonText: 'Show Now',
                                    onPressed: () {},
                                    category: 'Margherita Pizza',
                                    descText:
                                        'A collection of best tasting pizza and most popular one',
                                    color: MyColors.myLightGrayishBlue,
                                    height: 350,
                                    image:
                                        'https://t4.ftcdn.net/jpg/06/08/19/47/240_F_608194708_xV1BFnERt6hWPUsXcMop4IH4pIbZqa5t.png'),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
