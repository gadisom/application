//
//  TableViewCell.swift
//  final
//
//  Created by 김정원 on 2023/06/05.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var checkmark: UIImageView!
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
   
    
}
