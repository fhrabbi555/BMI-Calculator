import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI-Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI',style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),

              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your Weight'),
                  prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30,),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text('Enter your Height'),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30,),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                    label: Text('Enter your Age'),
                    prefixIcon: Icon(Icons.numbers)
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 30,),

              ElevatedButton(onPressed: (){

                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inc = inController.text.toString();

                if(wt != "" && ft != "" && inc != ""){

                  var iwt = int.parse(wt);
                  var ifit = int.parse(ft);
                  var iinc = int.parse(inc);

              //  Convert height to inches
                  var heightInInches = (ifit * 12) + iinc;

               //Calculate BMI
                  var bmi = (iwt / (heightInInches * heightInInches)) * 703;

                  setState(() {
                    result = "Your BMI is: ${bmi.toStringAsFixed(4)}";
                  });

                }else{
                  setState(() {
                    result = "Please fill all the required field";
                  });
                }

              }, child: Text('Calculate')),
              SizedBox(height: 30,),
              Text(result,style: TextStyle(fontSize: 15),)
            ],
          ),
        ),
      )
    );
  }
}
