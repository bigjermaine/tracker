//
//  TransactionViewModel.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]
final class TransactionViewModel: ObservableObject {
    
    @Published var Transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }

                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
        // TransactionListViewModel.swift
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error fetching transactions:", error.localizedDescription)
            case .finished:
                print("Finished fetching transactions")
            }
        }, receiveValue: { [weak self] result in
            self?.Transactions = result
                dump(self?.Transactions as Any)
        })
        .store(in: &cancellables)
    }
    func grouptransactionbymonth() -> TransactionGroup {
        guard !Transactions.isEmpty else {return[:]}
        
    let groupTransactions =   TransactionGroup(grouping: Transactions) { $0.month}
        
        return groupTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        print("accumulateTransactions")
        guard !Transactions.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParsed() // Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval)
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()

        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = Transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            sum += dailyTotal
            cumulativeSum.append((date.formatted(), sum))
            sum = sum.roundedto2digits()
                print(date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum)
        }
        return cumulativeSum
    }
    
}

