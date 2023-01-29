//
//  TransactionView.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 21/09/2022.
//

import SwiftUI

struct TransactionView: View {
    var transaction:Transaction
    var body: some View {
        List{
            // MARK: Hero
            VStack(spacing: 6) {
                Text(transaction.signedAmount, format: .currency(code: "USD"))
                    .font(.largeTitle)
                    .bold()
                Text(transaction.merchant)
                    .lineLimit(1)

                Text(transaction.dateParsed, format: .dateTime.year().month(.wide).day())
               
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            // MARK: Date
            TransactionDetailRow(icon: .calendar, title: "Date", text: transaction.dateParsed.formatted(.dateTime.year().month(.wide).day().weekday(.wide)))

            // MARK: Financial Institution
            TransactionDetailRow(icon: .landmark, title: "Financial Institution", text: transaction.institution)
            // MARK: Category
            NavigationLink {

            } label: {
                TransactionDetailRow(icon: .list, title: "Category", text: transaction.category)
            }

        }
       
        .listStyle(.plain)
            .navigationTitle("Transaction")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
    
            TransactionView(transaction: transactionPreviewData)
        
    }
}
