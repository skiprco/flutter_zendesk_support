import Flutter
import UIKit
import ZendeskSDK
import ZendeskCoreSDK

public class SwiftFlutterZendeskSupportPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_zendesk_support", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterZendeskSupportPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ flutterMethodCall: FlutterMethodCall, result: @escaping FlutterResult) {
    if flutterMethodCall.method.elementsEqual("init"){
        let args = flutterMethodCall.arguments as? NSDictionary

        let appId = args!["appId"]as? String
        let clientId  = args!["clientId"]as? String
        let url = args!["url"]as? String

        Zendesk.initialize(appId: appId!,
                           clientId: clientId!,
                           zendeskUrl: url!)
        Support.initialize(withZendesk: Zendesk.instance)

        let ident = Identity.createAnonymous()
        Zendesk.instance?.setIdentity(ident)
    }

    if flutterMethodCall.method.elementsEqual("openHelpCenter"){
        // HELP CENTER
        //TODO : check if inited
        let hcConfig = HelpCenterUiConfiguration()
        hcConfig.groupType = .section
        hcConfig.groupIds = [1234, 5678] //TODO
        let vc = HelpCenterUi.buildHelpCenterOverviewUi(withConfigs: [hcConfig])

        self.openViewController(vc:vc)
    }

    if flutterMethodCall.method.elementsEqual("openTicket"){
        // REQUESTS
        //TODO : check if inited
        let config = RequestUiConfiguration()
        config.subject = "Ticket"
        config.tags = ["ios"]
        let vc = RequestUi.buildRequestUi(with: [config])

        self.openViewController(vc:vc)
    }

    if flutterMethodCall.method.elementsEqual("openTickets"){
        // REQUESTS
        //TODO : check if inited
        let vc = RequestUi.buildRequestList()

        self.openViewController(vc:vc)
    }
  }

  func openViewController(vc: UIViewController){
    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
        navigationController.pushViewController(vc, animated: true)
    }

    let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
    
    //vc.modalPresentationStyle = .
    
    let flutterViewController  = window.rootViewController as? FlutterViewController;
    flutterViewController?.present(vc, animated: true, completion: {
        //TODO async return
    })
  }
}
