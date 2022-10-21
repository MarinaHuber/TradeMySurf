//
//  File.swift
//  TradeMySurf
//
//  Created by Ujval Shah on 08/09/22.
//  Copyright © 2022 Marina Huber. All rights reserved.
//

import Foundation
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewControllerReprsentable:UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> some UIViewController{
        return UIStoryboard(name:"SplashViewController",bundle: nil).instantiateInitialViewController()!
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
}
@available(iOS 13.0 ,*)
struct SplashViewController_Preview:PreviewProvider {
    static var previews: some View{
        ViewControllerReprsentable()
            
    }
}

#endif
