import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties: AdditionalProperties(
      pubName: 'boton_api',
      pubAuthor: 'Cesar Guzman', // Nombre del autor
      pubDescription: 'Boton API',
    ),
    runSourceGenOnOutput: true,
    inputSpecFile: 'openapi.yaml', // Ruta relativa al archivo OpenAPI
    generatorName: Generator.dio,
    outputDirectory:
        'lib/boton_api' // Directorio de salida para el código generado
    )
class GeneratorApi {}
