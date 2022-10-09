package com.example.flutter_rust_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.flutter_rust_app/greet"

    init {
        System.loadLibrary("rust_android_lib")
    }

    external fun greet(to: String): String

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            // This method is invoked on the main thread.
            if (call.method == "greet") {
                val to = call.argument<String>("to")
                val message = to?.let { greet(it) }
                if (message !=null) {
                    result.success(message)
                } else {
                    result.error("UNAVAILABLE", "can't get greet message", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}