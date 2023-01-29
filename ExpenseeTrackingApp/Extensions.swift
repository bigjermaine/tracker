//
//  Extensions.swift
//  ExpenseeTrackingApp
//
//  Created by Apple on 20/09/2022.
//

import Foundation
import SwiftUI


extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
        
    }()
}
    extension String {
        func dateParsed() -> Date {
            guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }

            return parsedDate
        }
    }

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}


extension Double {
    func roundedto2digits() -> Double {
        return(self * 100).rounded() / 100
    }
}
