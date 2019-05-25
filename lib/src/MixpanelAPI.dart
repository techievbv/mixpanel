import 'dart:async';
import 'package:flutter/services.dart';

import 'MixpanelMockedAPI.dart';

class MixpanelAPI
{
  static const String _pluginName = "flutuate.io/plugins/mixpanel";

  static const MethodChannel _channel = const MethodChannel(_pluginName);

  static Future<MixpanelAPI> getInstance(String token, {bool mocked=false}) async {
    if( mocked) {
  static Future<MixpanelAPI> getInstance(String token, [bool optOutTrackingDefault]) async {
	Map<String, dynamic> properties = <String, dynamic>{
      return new MixpanelMockedAPI();
    }

      'token': token
    };
	if( optOutTrackingDefault != null )
		properties['optOutTrackingDefault'] = optOutTrackingDefault;
    await _channel.invokeMethod<int>('getInstance', properties);
    return new MixpanelAPI();
  }

  void flush() {
      _channel.invokeMethod<void>('flush');
  }

  void track(String eventName, Map<String, dynamic> properties) {
    _channel.invokeMethod<void>('track', <String, dynamic> {
      'eventName': eventName,
      'properties': properties
    });
  }
  
  Future<Map<String, String>> getDeviceInfo() async {
    return await _channel.invokeMethod<Map<String,String>>('getDeviceInfo');
  }
  
  Future<String> getDistinctId() async {
    return await _channel.invokeMethod<String>('getDistinctId');
  }
  
  void optInTracking() {
    _channel.invokeMethod<void>('optInTracking');
  }
  
  void optOutTracking() {
    _channel.invokeMethod<void>('optOutTracking');
  }
  
  void reset() {
    _channel.invokeMethod<void>('reset');
  }
}
