//
//  RecentTransactionList.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import SwiftUI
import SwiftUICharts

struct RecentTransactionList: View {
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        // RecentTransactionList.swift
        VStack{
            BarChartView()
        
            VStack {
                
                
                HStack {
                    // MARK: Header Title
                    Text("Recent Transactions")
                        .bold()
                    
                    Spacer()
                    
                    // MARK: Header Link
                    NavigationLink {
                        TransactionList()
                    } label: {
                        HStack(spacing: 4) {
                            Text("See All")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(Color.blue)
                    }
                }
                .padding(.top)
                // MARK: Recent Transaction List
                ForEach(Array(transactionViewModel.Transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                    NavigationLink {
                        TransactionView(transaction: transaction)
                    }label:{
                        TransactionRow(transaction: transaction)
                    }
                    
                    Divider()
                        .opacity(index == 4 ? 0 : 1)
                }
            }
            .padding()
            .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .ignoresSafeArea()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        .ignoresSafeArea()
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionViewModel: TransactionViewModel = {
        let transactionViewModel = TransactionViewModel ()
        transactionViewModel.Transactions = transactionListPreviewData
        return transactionViewModel
        
    }()
    static var previews: some View {
    
            RecentTransactionList()
            
                .environmentObject(transactionViewModel)
           
    
    }
}
