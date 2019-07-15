//
//  BillViewController.swift
//  MultipleSelectionDemo
//
//  Created by Admin on 13/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {

    var Quntity = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("selected items \(selectedProduct)")
        ProductExtension.instance.showBill(view: view, quntityarr: Quntity)
        print(Quntity)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
