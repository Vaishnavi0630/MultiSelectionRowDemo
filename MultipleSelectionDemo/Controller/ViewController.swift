//
//  ViewController.swift
//  MultipleSelectionDemo
//
//  Created by Admin on 13/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quntityArray  = NSMutableArray()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductExtension.instance.readJson()
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @IBAction func clickOnBill(_ sender: Any) {
        
        performSegue(withIdentifier: moveToBilling, sender: self)
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier ==  moveToBilling) {
            if let destination = segue.destination as? BillViewController {
                destination.Quntity = quntityArray
            }
        }
    }
}


//MARK: TableView Methods

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.txtQuntity.tag = indexPath.row
        cell.txtQuntity.delegate = self
        cell.product = productData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForRow)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedProduct.append(productData[indexPath.row])
    }
}


//MARK: Textfield Method

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("quntity is \(textField.text)")
        quntityArray.add(textField.text)
        textField.resignFirstResponder()
        return true
    }
    
}
