import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'olcp_response.freezed.dart';

@freezed
class OlcpResponse with _$OlcpResponse {
  const factory OlcpResponse({
    required int requestCode,
    required int resultCode,
    @Default([]) List<int> responseParameter,
  }) = _OlcpResponse;

  factory OlcpResponse.fromByteArray(List<int> byteArray) {
    log('filtergatt:OLCP Response: $byteArray');
    return OlcpResponse(
      requestCode: byteArray[0],
      resultCode: byteArray[2],
    );
  }
}
