import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _altura = 0;
  double _kg = 0;

  // Variável para armazenar o resultado das operações
  double _result = 0;

  String _resposta = "";

  // Função para somar os valores dos operandos
  void _calcularIMC() {
    setState(() {
      _result = (_kg / (_altura * _altura) * 10000);

      if (_result < 17) {
        _resposta = 'Magro demais';
      } else if (_result > 17 && _result < 18.5) {
        _resposta = 'Magro moderado';
      } else if (_result > 18.6 && _result < 24.9) {
        _resposta = 'Peso normal';
      } else if (_result > 25 && _result < 29.9) {
        _resposta = 'Acima do peso';
      } else if (_result > 30 && _result < 34.9) {
        _resposta = 'Obesidade grau I';
      } else if (_result > 35 && _result < 39.9) {
        _resposta = 'Obesidade grau II';
      } else if (_result > 40) {
        _resposta = 'Obesidade grau III';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o primeiro operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Informe a altura em cm'),
              onChanged: (value) {
                _altura = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para o segundo operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Informe o peso em kgs'),
              onChanged: (value) {
                _kg = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Botões para realizar as operações

            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular o IMC:'),
            ),

            SizedBox(height: 2.0),
            // Exibição do resultado
            Text(
              'Resultado: $_result',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_resposta',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text('Criado por Paola de Oliveira')
          ],
        ),
      ),
    );
  }
}
