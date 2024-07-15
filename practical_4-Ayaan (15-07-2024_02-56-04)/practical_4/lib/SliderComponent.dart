import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliderComponent extends StatefulWidget {
  const SliderComponent({super.key});

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  double _silderValue = 0.0;
  double _secondValue = 0.0;
  double _sum = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child:Padding(
        padding: EdgeInsets.all(80),
      child:Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0,color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(24)
        ),
        child:Padding(
          padding: EdgeInsets.all(40),
        child:Column(
        children: [
          Text("Slider Calculator",style: TextStyle(fontSize: 48),),
          SizedBox(height: 40,),
          Slider(value:_silderValue,
          label:_silderValue.round().toString(),
           onChanged:(value){setState(() {
            _silderValue = value;
                        _sum = _silderValue + _secondValue;

          })
          ;},
          min: 0.0,
          max: 100.0,
          divisions: 100,),
          Text('Slider Value: ${_silderValue.toStringAsFixed(1)}',style: TextStyle(fontSize: 24),),

          SizedBox(height: 40,),

          Slider(onChanged: (value){setState(() {
            _secondValue = value;
                        _sum = _silderValue + _secondValue;

          });},
          value: _secondValue,
          min: 0.0,
          max: 100.0,
          divisions: 100,),
          Text('Slider Value: ${_secondValue.toStringAsFixed(1)}',style: TextStyle(fontSize: 24),),
          SizedBox(height: 60,),
          
          ElevatedButton(onPressed: (){setState(() {
            _sum = _silderValue + _secondValue;
          });}, child: Text('sum : $_sum'))
        ],
      ),
        ) 
      )
      )
      )
      );
  }
}