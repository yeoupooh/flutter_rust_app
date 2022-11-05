import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private func cgreetInternal(to: String, result: FlutterResult) {
        print("swift: to=", to.count)
        let cstr = cgreet(to.cString(using: .utf8)).unsafelyUnwrapped
        print("swift: cstring len=", strlen(cstr))
        print("swift: cstring=", cstr)
        let json = String(cString: cstr)
        free_string(cstr)
        result(json)
    }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // flutter method channel
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "com.example.flutter_rust_app/greet",
                                                  binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            
            switch call.method {
            case "greet" :
                // Handle battery messages.
                guard let args = call.arguments else {
                    print("no args")
                    return
                }
                let myargs = args as? [String: Any]
                guard let to = myargs?["to"] as? String else {
                    print("no arg to")
                    return
                }
                
                // FIXME check html is not null
                self.cgreetInternal(to: to, result: result)
                break
                
            default:
                print("no method")
                result(FlutterMethodNotImplemented);
                break
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
