// import 'package:earning_fish_ui/Screen/fish_details.dart';
// import 'package:earning_fish_ui/bloc/fish_bloc.dart';
// import 'package:earning_fish_ui/utlits/const_Color.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth= MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.9),
//       appBar: AppBar(
//         backgroundColor: CupertinoColors.black,
//         title: const Text('Product Grid', style: TextStyle(color: Colors.white)),
//       ),
//       body: SizedBox(
//         width: screenWidth,
//         child: GridView.builder(
//           padding: const EdgeInsets.all(10.0),
//           itemCount: FishData().getFishData().length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10.0,
//             mainAxisSpacing: 10.0,
//             childAspectRatio: 0.75,
//           ),
//           itemBuilder: (context, index) {
//             final product =  FishData().getFishData()[index];
//             return Container(
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     product['image']!,
//                     height: 70,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         product['name']!,
//                         textAlign: TextAlign.start,
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 80,
//                         decoration: BoxDecoration(
//                             color: ConstColor.greyColor,
//                             borderRadius: BorderRadius.circular(10)
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                                 product['price']!,
//                                 style: const TextStyle(
//                                   fontSize: 16.0,
//                                   color: Colors.black,
//                                 ),
//                               ),
//
//                             const SizedBox(width: 5),
//                             const Icon(
//                               Icons.monetization_on,
//                               color: Colors.amber,
//                               size: 18.0,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: 35,
//                     width: 130,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Implement purchase logic
//                         //print('Buy $productName for \$${price.toStringAsFixed(2)}');
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => BlocProvider(
//                               create: (context) => FishBloc(),
//                               child: const NemoFishScreen(),
//                             ),
//                           ),
//                         );
//
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: ConstColor.buttonColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       child: const Text('Buy',style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       )
//     );
//   }
// }
