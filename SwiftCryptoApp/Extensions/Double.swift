//
//  Double.swift
//  SwiftCryptoApp
//
//  Created by Lalana Chamika on 2023-11-12.
//

import Foundation

extension Double {
    
    
    /// Converts a Double into 3-3 decimal comma seperated formatted currency
    ///```
    /// Convert 1234.56 to $1,234.560
    ///```
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        return formatter
    }
    
    /// Converts a Double into 2-6 decimal comma seperated formatted currency as String
    ///```
    /// Convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencyWith6Decimal() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    
    /// Converts a Double into 2 decimal string
    ///```
    /// Convert 1234.56231 to "1234.56"
    ///```
    func numAsString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    /// Converts a Double into 2 decimal string with %
    ///```
    /// Convert 1234.56231 to "1234.56%"
    ///```
    func asPercentString() -> String {
        return numAsString() + "%"
    }
    
    
}
