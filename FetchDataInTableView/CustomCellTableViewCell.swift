//
//  CustomCellTableViewCell.swift
//  FetchDataInTableView
//
//  Created by muhammad hassan on 27/02/2022.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFatherName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
