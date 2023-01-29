//
//  TransactionRow.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import SwiftUI
import SwiftUIFontIcon
struct TransactionRow: View {
    var transaction:Transaction
    
    var body: some View {
        HStack(spacing:20) {
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.blue.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                        FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.red)
                    }
        
            
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                Text(Date(), format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.green :Color.red)
            
        }
    }
    
}
struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group
        {
           
            TransactionRow(transaction:transactionPreviewData)
            TransactionRow(transaction:transactionPreviewData).preferredColorScheme(.dark)
        }
    }
}
