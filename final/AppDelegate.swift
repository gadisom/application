//
//  AppDelegate.swift
//  final
//
//  Created by 김정원 on 2023/05/27.
//
import NaverThirdPartyLogin
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KakaoSDK.initSDK(appKey: "55234f6f6fcdd1b91cf66397138fe072")
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        //네이버 앱으로 인증하는 방식
        instance?.isNaverAppOauthEnable = true
        // viewcontroller 에서 인증하는 방식을 활성화
        instance?.isInAppOauthEnable = true
        //세로화면에서만 인증 가능
        instance?.isOnlyPortraitSupportedInIphone()
        // url scheme
        instance?.serviceUrlScheme = kServiceAppUrlScheme
        instance?.consumerKey = kConsumerKey
        instance?.consumerSecret = kConsumerSecret
        instance?.appName = kServiceAppName
    
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url,options: options)
        return true 
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

