import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   Widget titleSection = Positioned(
     bottom: 0,
     left: 16,
     right: 16,
     child: Container(
       padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(
         color: Colors.black.withOpacity(0.7),
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(16),
           topRight: Radius.circular(16),
         ),
       ),
       child: Row(
         children: [
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   padding: const EdgeInsets.only(bottom: 8),
                   child: const Text(
                     'Oeschinen Lake Campground',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                     ),
                   ),
                 ),
                 Text(
                   'Kandersteg, Switzerland',
                   style: TextStyle(
                     color: Colors.grey[500],
                   ),
                 ),
               ],
             ),
           ),
           Icon(
             Icons.star,
             color: Colors.red[500],
           ),
           const Text(
             '41',
             style: TextStyle(
               color: Colors.white,
             ),
           ),

         ],
       ),
     ),
   );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Positioned(
      top: 16,
      right: 16,
      child: Container(
        color: Colors.white.withOpacity(0.7), // Напівпрозорий білий фон
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
            SizedBox(width: 16),
            _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
            SizedBox(width: 16),
            _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
          ],
        ),
      ),
    );


    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

   Widget buildImageStack(int imageNumber) {
     return Stack(
       children: [
         Image.asset(
           'image/lake.jpg',
           width: 600,
           height: 240,
           fit: BoxFit.cover,
         ),
         titleSection,
         buttonSection,
         Positioned(
           top: 16,
           left: 16,
           child: Container(
             width: 72,
             height: 72,
             decoration: BoxDecoration(
               color: Colors.black.withOpacity(0.8),
               shape: BoxShape.circle,
             ),
             child: Center(
               child: Text(
                 '#$imageNumber.',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ),
         ),
       ],
     );
   }


   return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body:  ListView(
          children: List.generate(20, (index) => buildImageStack(index + 1)),
          ),
        ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

