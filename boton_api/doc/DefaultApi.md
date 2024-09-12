# boton_api.api.DefaultApi

## Load the API package
```dart
import 'package:boton_api/api.dart';
```

All URIs are relative to */boton*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checarComunicacionGet**](DefaultApi.md#checarcomunicacionget) | **GET** /checarComunicacion | Verificar la comunicación
[**enviarAlertaPost**](DefaultApi.md#enviaralertapost) | **POST** /enviarAlerta | Enviar una alerta
[**enviarAudioPost**](DefaultApi.md#enviaraudiopost) | **POST** /enviarAudio | Enviar un audio
[**enviarFotoPost**](DefaultApi.md#enviarfotopost) | **POST** /enviarFoto | Enviar una foto
[**enviarMensajePost**](DefaultApi.md#enviarmensajepost) | **POST** /enviarMensaje | Enviar un mensaje
[**enviarVideoPost**](DefaultApi.md#enviarvideopost) | **POST** /enviarVideo | Enviar un video
[**reportesListarGet**](DefaultApi.md#reporteslistarget) | **GET** /reportes/listar | Listar todos los reportes
[**reportesObtenerIdGet**](DefaultApi.md#reportesobteneridget) | **GET** /reportes/obtener/{id} | Obtener un reporte por ID


# **checarComunicacionGet**
> EnviarMensajePostRequest checarComunicacionGet()

Verificar la comunicación

Endpoint para checar si hay comunicación con el servicio.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();

try {
    final response = api.checarComunicacionGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->checarComunicacionGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**EnviarMensajePostRequest**](EnviarMensajePostRequest.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enviarAlertaPost**
> EnviarAlertaPost200Response enviarAlertaPost(enviarAlertaPostRequest)

Enviar una alerta

Envía una alerta con el `idDispositivo` y la `localizacion`, otros campos son opcionales.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();
final EnviarAlertaPostRequest enviarAlertaPostRequest = ; // EnviarAlertaPostRequest | Datos de la solicitud

try {
    final response = api.enviarAlertaPost(enviarAlertaPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->enviarAlertaPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **enviarAlertaPostRequest** | [**EnviarAlertaPostRequest**](EnviarAlertaPostRequest.md)| Datos de la solicitud | 

### Return type

[**EnviarAlertaPost200Response**](EnviarAlertaPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enviarAudioPost**
> EnviarMensajePost200Response enviarAudioPost(authorization, body)

Enviar un audio

Envía un archivo de audio al servicio de Telegram.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();
final String authorization = authorization_example; // String | 
final MultipartFile body = BINARY_DATA_HERE; // MultipartFile | Audio en formato de bytes

try {
    final response = api.enviarAudioPost(authorization, body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->enviarAudioPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**|  | 
 **body** | **MultipartFile**| Audio en formato de bytes | 

### Return type

[**EnviarMensajePost200Response**](EnviarMensajePost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: audio/mpeg
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enviarFotoPost**
> EnviarMensajePost200Response enviarFotoPost(authorization, body)

Enviar una foto

Envía una foto a través del servicio de Telegram.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();
final String authorization = authorization_example; // String | 
final MultipartFile body = BINARY_DATA_HERE; // MultipartFile | Foto en formato de bytes

try {
    final response = api.enviarFotoPost(authorization, body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->enviarFotoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**|  | 
 **body** | **MultipartFile**| Foto en formato de bytes | 

### Return type

[**EnviarMensajePost200Response**](EnviarMensajePost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: image/jpeg, image/png
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enviarMensajePost**
> EnviarMensajePost200Response enviarMensajePost(authorization, enviarMensajePostRequest)

Enviar un mensaje

Envía un mensaje de texto al servicio de Telegram.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();
final String authorization = authorization_example; // String | 
final EnviarMensajePostRequest enviarMensajePostRequest = ; // EnviarMensajePostRequest | Mensaje a enviar

try {
    final response = api.enviarMensajePost(authorization, enviarMensajePostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->enviarMensajePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**|  | 
 **enviarMensajePostRequest** | [**EnviarMensajePostRequest**](EnviarMensajePostRequest.md)| Mensaje a enviar | 

### Return type

[**EnviarMensajePost200Response**](EnviarMensajePost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enviarVideoPost**
> EnviarMensajePost200Response enviarVideoPost(authorization, body)

Enviar un video

Envía un video a través del servicio de Telegram.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();
final String authorization = authorization_example; // String | 
final MultipartFile body = BINARY_DATA_HERE; // MultipartFile | Video en formato de bytes

try {
    final response = api.enviarVideoPost(authorization, body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->enviarVideoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**|  | 
 **body** | **MultipartFile**| Video en formato de bytes | 

### Return type

[**EnviarMensajePost200Response**](EnviarMensajePost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: video/mp4
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportesListarGet**
> BuiltList<ReportesListarGet200ResponseInner> reportesListarGet()

Listar todos los reportes

Devuelve una lista de todos los reportes.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();

try {
    final response = api.reportesListarGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->reportesListarGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ReportesListarGet200ResponseInner&gt;**](ReportesListarGet200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportesObtenerIdGet**
> ReportesListarGet200ResponseInner reportesObtenerIdGet(id)

Obtener un reporte por ID

Devuelve un reporte específico basado en su ID.

### Example
```dart
import 'package:boton_api/api.dart';

final api = BotonApi().getDefaultApi();
final String id = id_example; // String | 

try {
    final response = api.reportesObtenerIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->reportesObtenerIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**ReportesListarGet200ResponseInner**](ReportesListarGet200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

