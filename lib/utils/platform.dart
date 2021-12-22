import 'package:flutter/foundation.dart';

const clientIsWeb = kIsWeb;
const clientIsMobile = !kIsWeb;
final deviceIsMobile = defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android;

final deviceIsDesktop = defaultTargetPlatform != TargetPlatform.iOS &&
    defaultTargetPlatform != TargetPlatform.android;
