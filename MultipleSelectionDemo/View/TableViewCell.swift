//
//  TableViewCell.swift
//  MultipleSelectionDemo
//
//  Created by Admin on 13/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblProduct: UILabel!
    
    @IBOutlet weak var txtQuntity: UITextField!
    
    var product: Product?{
        didSet{
            lblProduct.text = product?.ProductName
            if let priceOfProduct = product?.Price {
                lblPrice.text = String(priceOfProduct )
            }
            else{
               lblPrice.text = "";
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none

        // Configure the view for the selected state
    }
}
