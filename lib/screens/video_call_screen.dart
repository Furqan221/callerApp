import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: '07b63193969f435b891d4bb9cd088957',
          channelName: 'fluttering',
          tempToken:
              '007eJxTYFitMzf0cLCt0au3HDnBDjU+d8NfzXsrE/i0bPrxyPyetMcKDAbmSWbGhpbGlmaWaSbGpkkWloYpJklJlskpBhYWlqbmqZOjUhoCGRmmTpnHwAiFID4XQ1pOaUlJalFmXjoDAwAmgCIy'));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Video Call"),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,

                showNumberOfUsers: true,
              ),
              
              AgoraVideoButtons(
                client: _client,
                enabledButtons: [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
