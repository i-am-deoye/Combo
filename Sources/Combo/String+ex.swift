//
//  File.swift
//  
//
//  Created by 13402598 on 24/04/2024.
//

import Foundation


public extension String {
    var isWhiteSpace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isNotEmpty: Bool {
        return !self.isWhiteSpace
    }
    
    
    func abbrevate() -> String {
        guard self.count > 0 else { return "" }
        let `default` =  Character.init(.ExtendedGraphemeClusterLiteralType(stringLiteral: ""))
        
        let strs = self.components(separatedBy: " ")
        let first = strs.first!
        guard strs.count > 1 else { return "\(first.first ?? `default`)".uppercased() }
        let last = strs.last ?? ""
        
        return  first.isEmpty ? "" : "\(first.first ?? `default`)".uppercased()  + (last.isEmpty ? "" : "\(last.first ?? `default`)".uppercased())
    }
}
