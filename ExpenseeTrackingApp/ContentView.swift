//
//  ContentView.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment:.leading , spacing:24){
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                }
            
            }
          
            .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .toolbar {
                // MARK: Nortification Item
                
                ToolbarItem {
                    
                    Image(systemName: "bell.badge")
                        .foregroundStyle(.red,.black)
                     
                }
            
            }
            .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        
        .navigationBarHidden(true)
        .accentColor(.primary)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionViewModel: TransactionViewModel = {
        let transactionViewModel = TransactionViewModel ()
        transactionViewModel.Transactions = transactionListPreviewData
        return transactionViewModel
        
    }()
    static var previews: some View {
        
            ContentView().environmentObject(transactionViewModel)
             
        
    }
}
