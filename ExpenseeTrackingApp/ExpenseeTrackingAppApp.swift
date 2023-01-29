//
//  ExpenseeTrackingAppApp.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import SwiftUI

@main
struct ExpenseeTrackingAppApp: App {
    @StateObject var transactionViewModel = TransactionViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionViewModel)
        }
    }
}
