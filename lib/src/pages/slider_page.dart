import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlides = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valueSlides,
      min: 10.0,
      max: 400.0,
      onChanged: !_blockCheck
          ? (double value) {
              setState(() {
                _valueSlides = value;
              });
            }
          : null,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://www.capturelandscapes.com/wp-content/uploads/2017/03/DSC2441-Panorama.jpeg'),
      width: _valueSlides,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _blockCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      value: _blockCheck,
      onChanged: (valor) {
        setState(() {
          _blockCheck = valor;
        });
      },
      title: Text('Bloquear Slider'),
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      value: _blockCheck,
      onChanged: (valor) {
        setState(() {
          _blockCheck = valor;
        });
      },
      title: Text('Bloquear Slider'),
    );
  }
}
