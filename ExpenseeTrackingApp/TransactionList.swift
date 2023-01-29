//
//  TransactionList.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    var body: some View {
    
            VStack {
                List {
                    ForEach(Array(transactionViewModel.grouptransactionbymonth()), id: \.key) {
                        month, transactions in
                        // TransactionList.swift
                        Section {
                            ForEach(transactions) { transaction in
                                
                               
                                ZStack {
                                    TransactionRow(transaction: transaction)
                                    NavigationLink("") {
                                        TransactionView(transaction: transaction)
                                    }
                                    .opacity(0)
                                }
                            }
                        } header: {
                            // MARK: Transaction Month
                            Text(month)
                        }
                        .listSectionSeparator(.hidden)
                        
                    }
                    .listStyle(.plain)
                }
            }
            .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionViewModel:   TransactionViewModel = {
        let transactionViewModel = TransactionViewModel ()
        transactionViewModel.Transactions = transactionListPreviewData
        return transactionViewModel
        
    }()
    static var previews: some View {
        NavigationView {
            
            TransactionList().environmentObject(transactionViewModel)
            
        }
        
    }
}
