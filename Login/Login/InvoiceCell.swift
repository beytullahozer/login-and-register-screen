//
//  ViewController.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022..
//

import UIKit

class InvoiceCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var lblName = UILabel()
    var lblInvoiceNumber = UILabel()
    var lblTotal = UILabel()
    var lblDueDate = UILabel()
    var btnResend = UIButton()
    var btnPaid = UIButton()
    var btnMarkAsPaid = UIButton()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)


        contentView.addSubview(lblName)
        contentView.addSubview(lblInvoiceNumber)
        contentView.addSubview(lblTotal)
        contentView.addSubview(lblDueDate)
        contentView.addSubview(btnResend)
        contentView.addSubview(btnPaid)
        contentView.addSubview(btnMarkAsPaid)
        contentView.isUserInteractionEnabled = true
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
