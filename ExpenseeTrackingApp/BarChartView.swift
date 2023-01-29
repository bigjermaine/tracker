//
//  BarChartView.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import SwiftUI
import SwiftUICharts

struct BarChartView: View {
    @EnvironmentObject var transactionViewModel: TransactionViewModel
  //  var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        
        let data = transactionViewModel.accumulateTransactions()
     
            let totalexpenses = data.last?.1 ?? 0

            CardView{
                VStack(alignment:.leading){
                    ChartLabel(totalexpenses.formatted(.currency(code: "USD")), type:.title, format: "$%.02f")
                    LineChart()
                    
                }
                .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                
            }
            .data(data)
            .chartStyle(ChartStyle(backgroundColor: .white,
                                   foregroundColor: ColorGradient(.brown, .purple)))
            .frame(height:300)
            
            .background(LinearGradient(colors: [.blue,.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(25)
            .padding(.horizontal,8)
        
    }
      
    
}

struct BarChartView_Previews: PreviewProvider {
    
    static var previews: some View {
        BarChartView()
    }
}
