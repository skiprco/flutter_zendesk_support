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

        let url = args!["url"] as? String
        let appId = args!["appId"] as? String
        let clientId = args!["clientId"] as? String

        Zendesk.initialize(appId: appId!,
                           clientId: clientId!,
                           zendeskUrl: url!)
        
        Support.initialize(withZendesk: Zendesk.instance)

        let identity = Identity.createAnonymous()
        //let identity = Identity.createJwt(token: "get_unique_id")
        Zendesk.instance?.setIdentity(identity)
    }
    
    if flutterMethodCall.method.elementsEqual("authenticate"){
        let args = flutterMethodCall.arguments as? NSDictionary

        let token = args!["token"] as? String
        let name = args!["name"] as? String
        let email = args!["email"] as? String

        var identity : Identity;
        if (token != nil) {
            identity = Identity.createJwt(token: token!)
        } else {
            identity = Identity.createAnonymous(name:name, email:email)
        }
        
        Zendesk.instance?.setIdentity(identity)
    }

    if flutterMethodCall.method.elementsEqual("openHelpCenter"){
        // HELP CENTER
        //TODO : check if inited & auth done
        let hcConfig = HelpCenterUiConfiguration()
        hcConfig.groupType = .section
        hcConfig.groupIds = [1234, 5678] //TODO let appId = args!["ids"]as? String list
        let vc = HelpCenterUi.buildHelpCenterOverviewUi(withConfigs: [hcConfig])

        self.openViewController(vc:vc)
    }

    if flutterMethodCall.method.elementsEqual("openTicket"){
        // REQUESTS
        //TODO : check if inited & auth done
        let config = RequestUiConfiguration()
        config.subject = "Ticket"
        config.tags = ["ios"]
        let vc = RequestUi.buildRequestUi(with: [config])

        self.openViewController(vc:vc)
    }

    if flutterMethodCall.method.elementsEqual("openTickets"){
        // REQUESTS
        //TODO : check if inited & auth done
        let vc = RequestUi.buildRequestList()

        self.openViewController(vc:vc)
    }
  }

  func openViewController(vc: UIViewController){
    let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
    
    if let navigationController = window.rootViewController as? UINavigationController {
        navigationController.pushViewController(vc, animated: true)
        return
    }

    let flutterViewController = window.rootViewController as! FlutterViewController;

    // MODAL
    //vc.modalPresentationStyle = .
    //flutterViewController?.present(vc, animated: true, completion: {})

    // PUSH
    window.rootViewController = nil
    let navigationController = UINavigationController(rootViewController: flutterViewController)
    //navigationController.setNavigationBarHidden(true, animated: false)
    window.rootViewController = navigationController
    //window.makeKeyAndVisible()
    navigationController.pushViewController(vc, animated: true)
  }
}
