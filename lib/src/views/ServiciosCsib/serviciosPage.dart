import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatefulWidget {
  static const routeName = '/services'; // Define the route name here

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Map<String, String>> services = [
    {
      'title': 'Clínica Estomatológica',
      'url': 'https://www.izt.uam.mx/index.php/clinicas/clinica-estomatologica',
    },
    {
      'title': 'Programa de Nutrición',
      'url':
          'https://www.izt.uam.mx/index.php/programas-para-el-bienestar/apio',
    },
    {
      'title': 'Actividades Deportivas y Recreativas',
      'url':
          'https://www.izt.uam.mx/index.php/programas-para-el-bienestar/actdere',
    },
    {
      'title': 'Clínica de Acupuntura y Fitoterapia',
      'url':
          'https://www.izt.uam.mx/index.php/clinicas/clinica-de-acupuntura-y-fitoterapia',
    },
    {
      'title': 'Programa de Apoyo y Orientación Psicológica',
      'url':
          'https://www.izt.uam.mx/index.php/programas-para-el-bienestar/picabiuami',
    },
    {
      'title': 'Laboratorio Clínico',
      'url':
          'https://www.izt.uam.mx/index.php/programas-para-el-bienestar/ascsib',
    },
    {
      'title': 'Clínica de Trastornos del Sueño',
      'url': 'https://www.izt.uam.mx/index.php/clinicas/clinicasueno',
    },
    {
      'title': 'Jóvenes, Sexualidad y Salud Reproductiva',
      'url':
          'https://www.izt.uam.mx/index.php/programas-para-el-bienestar/saludsex',
    },
    {
      'title': 'Servicio Médico',
      'url': 'https://www.izt.uam.mx/index.php/servicio-medico',
    },
    {
      'title': 'Línea UAM',
      'url': 'https://lineauam.uam.mx/index.htm',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text('Servicios'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service['title'] ?? ''),
            onTap: () => _launchURL(service['url'] ?? ''),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    launchUrl(Uri.parse(url));
  }
}
