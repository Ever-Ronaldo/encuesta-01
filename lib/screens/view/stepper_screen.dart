import 'package:encuesta_app/screens/screens.dart';
import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudio Socioeconómico'),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Stepper(
              type: stepperType,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (value) => tapped(value),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: [
                Step(
                  title: const Text('Datos personales'),
                  content: Column(
                    children: [
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Nombres y Apellidos'),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'N° DNI',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Región',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Provincia',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Distrito',
                        ),
                      ),
                      const SizedBox(height: 7),
                      //TODO: cambiar por un select
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nivel de Educación',
                        ),
                      ),
                      const SizedBox(height: 7),
                      //TODO: cambiar por un select
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Genero',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Edad',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cantidad de Hijos',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cuantos Estudian',
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Mano de Obra',
                        ),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Datos economicas'),
                  content: Column(
                    children: [
                      const Text('Actividad económica',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                              value: 'Agropecuaria',
                              child: Text('Agropecuaria')),
                          DropdownMenuItem(
                              value: 'Construcción',
                              child: Text('Construcción')),
                          DropdownMenuItem(
                              value: 'Transporte y comunicaciones',
                              child: Text('Transporte y comunicaciones')),
                          DropdownMenuItem(
                              value: 'Minería', child: Text('Minería')),
                          DropdownMenuItem(
                              value: 'Comercio', child: Text('Comercio')),
                          DropdownMenuItem(
                              value: 'Otros', child: Text('Otros')),
                        ],
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 12),
                      const Text('Ingreso Total',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                              value: '0 a 160', child: Text('0-160')),
                          DropdownMenuItem(
                              value: '164 a 264', child: Text('164 - 264')),
                          DropdownMenuItem(
                              value: 'Mayor a 265', child: Text('Mayor a 265')),
                        ],
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 12),
                      const Text('Servicios Básicos',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      CheckboxListTile(
                        title: const Text('Agua'),
                        value: true,
                        onChanged: (value) => setState(() {
                          value = true;
                        }),
                      ),
                      CheckboxListTile(
                        title: const Text('Luz'),
                        value: true,
                        onChanged: (value) => setState(() {
                          value = false;
                        }),
                      ),
                      CheckboxListTile(
                        title: const Text('Internet'),
                        value: false,
                        onChanged: (value) => setState(() {
                          value = true;
                        }),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                          'Tipo de Material de Construcción de la Vivienda',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                              value: 'Material noble',
                              child: Text('Material noble')),
                          DropdownMenuItem(
                              value: 'Prefabricados',
                              child: Text('Prefabricados')),
                          DropdownMenuItem(
                              value: 'Hormigon, cemento y ladrillos',
                              child: Text('Hormigon, cemento y ladrillos')),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Piso Forrajero'),
                  content: Column(
                    children: [
                      const Text(
                          '¿Tiene Capacidad de Incrementar la Superficie Instalada?'),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.1. Has bajo riego')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.2. Has en secano')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.3. propiedad o arrendadas')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.4. Has de alfalfa')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.5. Has de  rye grass')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.6.Has de  avena forrajera ')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.7. Has de cebada forrajera')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child:
                                      Text('2.8. has de  pastos naturales?')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('2.9. total de hectareas')),
                              SizedBox(
                                  width: 120,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: '¿Cuantos?'),
                                  )),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text(
                                      '2.10 ¿Por qué razon decidio sembrar los cultivos que  tiene en sus tierras?')),
                              SizedBox(
                                  child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: '¿Por qué?'),
                              )),
                            ],
                          ),
                        ),
                      ),

                      //TODO: Consultar
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                    title: const Text('Acceso al Riego '),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('3.1. ¿Tiene riego?')),
                                SizedBox(
                                  width: 160,
                                  child: SwitchListTile.adaptive(
                                    title: const Text('No, Si'),
                                    value: false,
                                    onChanged: (value) => setState(() {
                                      value = false;
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '3.2. ¿Cuál es el tipo de riego que utiliza?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Riego por gravedad',
                                        child: Text('Riego por gravedad')),
                                    DropdownMenuItem(
                                        value: 'Riego por goteo',
                                        child: Text('Riego por goteo')),
                                    DropdownMenuItem(
                                        value: 'Riego por aspersión',
                                        child: Text('Riego por aspersión')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '3.3. ¿Cual es la fuente de agua?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Pozo', child: Text('Pozo')),
                                    DropdownMenuItem(
                                        value: 'Rio', child: Text('Rio')),
                                    DropdownMenuItem(
                                        value: 'Lago o laguna',
                                        child: Text('Lago o laguna')),
                                    DropdownMenuItem(
                                        value: 'Pozo tubular',
                                        child: Text('Pozo tubular')),
                                    DropdownMenuItem(
                                        value: 'Manantial',
                                        child: Text('Manantial')),
                                    DropdownMenuItem(
                                        value: 'Reservorio / presa',
                                        child: Text('Reservorio / presa')),
                                    DropdownMenuItem(
                                        value: 'Otros', child: Text('Otros'))
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '3.4. ¿Considera usted que el agua de riego esta contaminada?')),
                                SizedBox(
                                  width: 160,
                                  child: SwitchListTile.adaptive(
                                    title: const Text('No, Si'),
                                    value: true,
                                    onChanged: (value) => setState(() {
                                      value = false;
                                    }),
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Contaminada por relaves mineros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Contaminada por desagues industriales'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Contaminada por otras sustancias'),
                                  value: false,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Pertenece usted a alguna comisión de regantes?')),
                                SizedBox(
                                  width: 160,
                                  child: SwitchListTile.adaptive(
                                    title: const Text('No, Si'),
                                    value: true,
                                    onChanged: (value) => setState(() {
                                      value = false;
                                    }),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuál?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Step(
                  title: const Text('Infraestructura Agropecuaria'),
                  content: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.1. Cobertizos'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.2. Miniestablos'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.3. Comederos'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.4. Bebederos'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.5. Ternejare'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.6. Sala de ordeño'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.7. Plataforma de ordeño'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.8. invernadero'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.9. Galpon de cuyes'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.10. Silos para forraje'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.11. Cerco alambrado'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.12. Cerco electrico'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.13. Cerco de tapial '),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.14. Cerco de piedra'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('4.15. Establo lechero'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //TODO: bnt
                ),
                Step(
                  title: const Text(
                      'Inventario de maquinarias, equipos y herramientas'),
                  content: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.1. ¿Tractor agricola?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.2. ¿Empacadora?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.3. ¿Ordeñadora?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.4. ¿Molinera de forraje?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.5. ¿Motoguadaña?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.6. ¿Motocarga?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.7. ¿Porongo?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('5.8. ¿Picadora de forraje?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              CheckboxListTile(
                                title: const Text('¿Otro?'),
                                value: true,
                                onChanged: (value) => setState(() {
                                  value = true;
                                }),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '¿Cuantos?',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //TODO: btn
                ),
                Step(
                  title: const Text('Acceso a financiamiento'),
                  content: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text(
                                      '¿Tiene usted acceso a creditos para el financiamiento de su unidad productiva?')),
                              SizedBox(
                                width: 160,
                                child: SwitchListTile.adaptive(
                                  title: const Text('No, Si'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = false;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child: Text('Indique el nombre')),
                              DropdownButtonFormField(
                                items: const [
                                  DropdownMenuItem(
                                      value: 'Cajas municipales ',
                                      child: Text('Cajas municipales ')),
                                  DropdownMenuItem(
                                      value: 'Caja rural',
                                      child: Text('Caja rural')),
                                  DropdownMenuItem(
                                      value: 'Cooperativa de Ahorro y Credito',
                                      child: Text(
                                          'Cooperativa de Ahorro y Credito')),
                                  DropdownMenuItem(
                                      value: 'Banco', child: Text('Banco')),
                                  DropdownMenuItem(
                                      value: 'Agrobanco',
                                      child: Text('Agrobanco')),
                                  DropdownMenuItem(
                                      value: 'ONG', child: Text('ONG')),
                                  DropdownMenuItem(
                                      value: 'Otros fondos',
                                      child: Text('Otros fondos')),
                                ],
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              const Center(
                                  heightFactor: 2,
                                  child:
                                      Text('¿Para que solicito el credito?')),
                              DropdownButtonFormField(
                                items: const [
                                  DropdownMenuItem(
                                      value: 'Adquisicion de insumos',
                                      child: Text('Adquisicion de insumos')),
                                  DropdownMenuItem(
                                      value: 'Adquisicion de maquinarias',
                                      child:
                                          Text('Adquisicion de maquinarias')),
                                  DropdownMenuItem(
                                      value: 'Adquisicion de ganado vacuno',
                                      child:
                                          Text('Adquisicion de ganado vacuno')),
                                  DropdownMenuItem(
                                      value: 'Para pagar otros creditos',
                                      child:
                                          Text('Para pagar otros creditos ')),
                                  DropdownMenuItem(
                                      value: 'Otros', child: Text('Otros')),
                                ],
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // TODO: btn
                ),
                Step(
                    title: const Text(
                        'Financiamiento de proyectos y/o plan de negocio'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Usted  y su organización  han tenido  acceso a financiamiento de su plan de negocios o proyecto por?')),
                                SizedBox(
                                  width: 160,
                                  child: SwitchListTile.adaptive(
                                    title: const Text('No, Si'),
                                    value: true,
                                    onChanged: (value) => setState(() {
                                      value = false;
                                    }),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Procompite nacional',
                                        child: Text('Procompite nacional')),
                                    DropdownMenuItem(
                                        value: 'Procompite Gobierno Regional ',
                                        child: Text(
                                            'Procompite Gobierno Regional')),
                                    DropdownMenuItem(
                                        value: 'Procompite Gobieno Municipal',
                                        child: Text(
                                            'Procompite Gobieno Municipal')),
                                    DropdownMenuItem(
                                        value: 'Fondoempleo',
                                        child: Text('Fondoempleo')),
                                    DropdownMenuItem(
                                        value: 'Cooperacion internacional',
                                        child:
                                            Text('Cooperacion internacional')),
                                    DropdownMenuItem(
                                        value: 'Agroideas',
                                        child: Text('Agroideas')),
                                    DropdownMenuItem(
                                        value: 'Empresa minera',
                                        child: Text('Empresa minera')),
                                    DropdownMenuItem(
                                        value: 'Foncodes',
                                        child: Text('Foncodes')),
                                        DropdownMenuItem(
                                        value: 'Otros',
                                        child: Text('Otros')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ), 
                    //TODO: btn
                    ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepsType,
        child: const Icon(Icons.save_outlined),
      ),
    );
  }

  tapped(int value) {
    setState(() {
      _currentStep = value;
    });
  }

  void continued() {
    _currentStep < 8 ? setState(() => _currentStep += 1) : null;
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void switchStepsType() {
    // setState(() => stepperType == StepperType.vertical ? stepperType = StepperType.horizontal : stepperType = StepperType.vertical);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}