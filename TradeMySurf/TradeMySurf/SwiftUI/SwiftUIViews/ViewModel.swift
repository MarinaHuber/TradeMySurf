import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func backAction() {
        navigationPath.append(NavigationOption.onboarding)
    }
    
    func closeAction() {
        navigationPath.append(NavigationOption.main)
    }
} 