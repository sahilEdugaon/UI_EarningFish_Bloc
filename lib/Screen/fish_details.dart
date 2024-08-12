import 'package:earning_fish_ui/Model/model.dart';
import 'package:earning_fish_ui/Screen/status_progress.dart';
import 'package:earning_fish_ui/bloc/fish_bloc.dart';
import 'package:earning_fish_ui/bloc/fish_event.dart';
import 'package:earning_fish_ui/bloc/fish_state.dart';
import 'package:earning_fish_ui/utlits/const_Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NemoFishScreen extends StatefulWidget {
  const NemoFishScreen({super.key});

  @override
  State<NemoFishScreen> createState() => _NemoFishScreenState();
}

class _NemoFishScreenState extends State<NemoFishScreen> {
  final _controller = DraggableScrollableController();
  double _buttonOffset = 0.55;


  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      if (_controller.size > 0.55) {
        _buttonOffset = _controller.size;
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var finalHeight = MediaQuery.of(context).size.height;
    var finalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: ConstColor.greyColor,
        appBar: AppBar(
          backgroundColor: ConstColor.greyColor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar( backgroundColor: Colors.white, child: Icon(Icons.notification_add_rounded)),
            ),

          ],
        ),
        body: BlocBuilder<FishBloc, FishState>(
          builder: (BuildContext context, state) {
           if(state is FishLoadingState){
             return const Center(child: CircularProgressIndicator(),);
           }
           else if(state is FishErrorState){
             return Center(child: Text(state.error??""),);
           }
           else if(state is FishLoaded){
             FishDataModel data = state.getFishData;
             return Stack(
               fit: StackFit.expand,
               children: [
                 Positioned(
                     top: finalHeight/8,
                     left: MediaQuery.of(context).size.width * 0.4 - 80,
                     child: Center(child: Image.asset(data.image, height: 150,))
                 ),
                 DraggableScrollableSheet(
                   minChildSize: 0.5,
                   initialChildSize: 0.5,
                   maxChildSize: 1.0,
                   expand: false,
                   snap: false,
                   snapSizes: const [0.5, 1.0],
                   controller: _controller,
                   builder: (context1, scrollController) {
                     return ClipRRect(
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(15),
                         topRight: Radius.circular(15),
                       ),
                       child: Container(
                         color: Colors.white,
                         child: ListView(
                           controller: scrollController,
                           children: [
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 15),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 30,),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(data.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: finalHeight/40),),
                                         Container(
                                           height: finalHeight/30,
                                           decoration: BoxDecoration(
                                               color: ConstColor.boxColor,
                                               borderRadius: BorderRadius.circular(20)
                                           ),
                                           child: FittedBox(
                                             child: Padding(
                                               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                                               child: Row(
                                                 children: [
                                                   Text(data.price, style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w500, fontSize: finalHeight/40),),
                                                   SizedBox(width: finalWidth/60,),
                                                   Image.asset("assets/images/coin.png", height: finalHeight/33,)
                                                 ],
                                               ),
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(vertical: 15),
                                     child: Text(data.details,
                                       style: TextStyle( fontSize: finalHeight/63,),),
                                   ),
                                   const Text("Similar Seller Fishes", style: TextStyle(fontWeight: FontWeight.w600),),
                                   SizedBox(height: finalHeight/80,),
                                      Wrap(
                                        children: List.generate(data.relatedItems.length, (index) {
                                          var data2= data.relatedItems[index];
                                          return Container(
                                            margin: EdgeInsets.all(8),
                                            height: 145,
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.20), // Shadow color
                                                  spreadRadius: 2, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: const Offset(0, 1), // Offset in the x and y direction
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                FittedBox(
                                                  child: Column(
                                                    children: [
                                                      Image.asset(data2.image, height: finalHeight / 18),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 10),
                                                        child: Text(data2.name, // Use the name from data
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: finalHeight / 52,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: finalHeight / 30,
                                                        margin: EdgeInsets.only(left: 15),
                                                        decoration: BoxDecoration(
                                                          color: ConstColor.boxColor,
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child: FittedBox(
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 4, vertical: 2),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Value",
                                                                  style: TextStyle(
                                                                    fontSize: 8,
                                                                    color: Colors.grey,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 3, right: 2),
                                                                  child: Text(data.price, // Use the price from data
                                                                    style: TextStyle(
                                                                      color: Colors.deepPurple,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 8,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Image.asset("assets/images/coin.png", height: 15, width: 10),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Next Feed Time",
                                                              style: TextStyle(
                                                                fontSize: finalHeight / 58,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.grey,
                                                              ),
                                                            ),
                                                            SizedBox(width: finalWidth / 13),
                                                            Text(
                                                              "00:00:00",
                                                              style: TextStyle(
                                                                fontSize: finalHeight / 58,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.deepPurple,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        FittedBox(
                                                          child: SizedBox(
                                                            width: finalWidth / 2,
                                                            child: StatusProgressIndicator(
                                                              segments: 8, // Total number of statuses
                                                              currentIndex: 0, // Currently active status index (zero-based)
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                         // crossAxisAlignment: CrossAxisAlignment.end,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Step",
                                                              style: TextStyle(
                                                                fontSize: finalHeight / 58,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.grey,
                                                              ),
                                                            ),
                                                            SizedBox(width: finalWidth / 4),
                                                            Text(
                                                              "Level 06",
                                                              style: TextStyle(
                                                                fontSize: finalHeight / 58,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: finalHeight / 80),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 35,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: ConstColor.buttonColor,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          _showConfirmationBottomSheet(context);
                                                          // _buyFish(context);
                                                        },
                                                        child: Text(
                                                          'Buy',
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                       )
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                     );
                   },
                 ),
                 Positioned(
                   bottom: finalHeight * (1 - _buttonOffset) - 330, // Adjust the 50 for the button height
                   left: MediaQuery.of(context).size.width * 0.25 - 65, // Center the button horizontally
                   child: SizedBox(
                     height: finalHeight/14,
                     width: finalWidth/1.15,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           backgroundColor: ConstColor.buttonColor,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10)
                           )
                       ),
                       onPressed: () {
                         _showConfirmationBottomSheet(context);
                       },
                       child: const Text('Buy Nemo', style: TextStyle(color: Colors.white),),
                     ),
                   ),
                 ),
               ],
               //  
             );
           }
           else{
             return const Text('SomeThing Error');
           }

          },

        )

        ,
      //      
    );
   //   
  }
  void _buyFish(BuildContext context) {
    BlocProvider.of<FishBloc>(context).add(BuyFishEvent());
    // Listen to the state changes and handle navigation
    BlocListener<FishBloc, FishState>(
      listener: (context, state) {
        print('state--$state');
        if (state is FishPurchaseSuccess) {
          Navigator.pop(context); //
          _showSuccessBottomSheet(context); // Show success message
          Future.delayed(const Duration(seconds: 1));
          Navigator.pop(context); // Close the current screen
        } else if (state is FishErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: const SizedBox.shrink(), // Child widget can be anything; it’s not displayed here
    );
  }
  void _showConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: (){
                    Navigator.pop(context); // Close the confirmation bottom sheet
                  },
                      child: const Icon(CupertinoIcons.multiply,color: Colors.grey,))
                ],
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Image.asset("assets/images/Icon.png",),
                    const Text(
                      'Are you sure you want to Buy Fish?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the confirmation bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(130, 30),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
                      backgroundColor: ConstColor.grey,
                    ),
                    child: const Text('Cancel',style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the confirmation bottom sheet
                      _showSuccessBottomSheet(context); // Show the success bottom sheet
                     /// i want work this function but something error Context
                      _buyFish(context);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(130, 30),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
                      backgroundColor: ConstColor.buttonColor,
                    ),
                    child: const Text('Buy',style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:(BuildContext context){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(onTap: (){
                      Navigator.pop(context); // Close the confirmation bottom sheet
                    },
                        child: const Icon(CupertinoIcons.multiply,color: Colors.grey,))
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      Image.asset("assets/images/tick.png",),
                      const Text(
                        'Successfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Congratulation your fish added to your aquarium.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10,color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }

    );
  }

}