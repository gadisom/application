//
//  ContactsCell.swift
//  final
//
//  Created by 김정원 on 2023/05/28.
//

import UIKit

class ContactsCell: UICollectionViewCell {
    
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var name: UILabel!
    func configure (_ contactsList : FriendData)
    {
        name.text = contactsList.name
        department.text = contactsList.department
        phoneNumber.text = contactsList.number
    }
    
}
