package com.example.flutter_rust_app

import androidx.annotation.NonNull
import com.sun.jna.Library
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.sun.jna.Native


class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.flutter_rust_app/greet"

    // JNI way
//    init {
//        System.loadLibrary("rust_android_lib")
//    }
//
//    external fun greet(to: String): String

    // JNA way
    interface JNAGreet : Library {
        fun jnagreet(to: String): String

        companion object {
            val INSTANCE = Native.load(
                "rust_android_jna_lib",
                JNAGreet::class.java
            ) as JNAGreet
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            // This method is invoked on the main thread.
            if (call.method == "greet") {
                val to = call.argument<String>("to")
                // JNI way
//                val message = to?.let { greet(it) }
                // JNA way
                val message = to?.let { JNAGreet.INSTANCE.jnagreet(it) }
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