//
//  ProductExtension.swift
//  MultipleSelectionDemo
//
//  Created by Admin on 13/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


var productData = [Product]()

var selectedProduct = [Product]()

class ProductExtension {
    
    static var instance = ProductExtension()
    
    //MARK: read JSON data from text file Method
    
    func readJson()
    {
        let t = "Json.txt".contentsOrBlank()
        if let data = t.data(using: .utf8) {
            if let json = try? JSON(data: data) {
                for item in json["data"].arrayValue {
                    let product = Product(ProductName: item["Product Name"].stringValue, Price: item["Price"].intValue, Tax: item["Tax"].doubleValue)
                    productData.append(product)
                }
            }
        }
    }
    
    //MARK: show Bill Method
    
    func showBill(view: UIView,quntityarr: NSMutableArray)  {
        
        var yPos = 100
        
        let title = UILabel()
        title.text = "Product Name"
        title.textAlignment = .center
        title.frame = CGRect( x:5, y:70, width:250, height: 80)
        view.addSubview(title)
        
        let quantitytitle = UILabel()
        quantitytitle.text = "Quantity"
        quantitytitle.textAlignment = .center
        quantitytitle.frame = CGRect( x:200, y:70, width:250, height: 80)
        view.addSubview(quantitytitle)
        
        var amount = Int()
        
        var tax = Double()
        
        for i in 0..<selectedProduct.count {
            let productName = UILabel()
            let quntity = UILabel()
            productName.text = selectedProduct[i].ProductName
            productName.textAlignment = .center
            productName.frame = CGRect( x:10, y:yPos, width:250, height: 80)
            
            quntity.text = quntityarr[i] as? String
            quntity.textAlignment = .center
            quntity.frame = CGRect( x:200, y:yPos, width:250, height: 80)
            
            amount = amount + selectedProduct[i].Price!
            
            tax = tax + selectedProduct[i].Tax!
            
            yPos += 90
            view.addSubview(productName)
            view.addSubview(quntity)
        }
        
        
        var totalamt = Double(amount)
        
        totalamt = totalamt + tax
        
        let total = UILabel()
        total.text = "Total Amount"
        total.textAlignment = .center
        total.frame = CGRect( x:5, y:yPos, width:250, height: 80)
        view.addSubview(total)
        
        let lblamount = UILabel()
        lblamount.text = String(totalamt)
        lblamount.textAlignment = .center
        lblamount.frame = CGRect( x:200, y:yPos, width:250, height: 80)
        view.addSubview(lblamount)
        
    }
}



public extension String {
    func contentsOrBlank()->String {
        if let path = Bundle.main.path(forResource:self , ofType: nil) {
            do {
                let text = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                return text
            } catch { print("Failed to read text from bundle file \(self)") }
        } else { print("Failed to load file from bundle \(self)") }
        return ""
    }
    
    func toDouble() -> Double {
        if let unwrappedNum = Double(self) {
            return unwrappedNum
        } else {
            // Handle a bad number
            print("Error converting \"" + self + "\" to Double")
            return 0.0
        }
    }
}

