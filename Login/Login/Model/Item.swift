//
//  Item.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 20.03.2022.
//

import Foundation


class Item{

    
    var description = String()
    var unitCost = Double()
    var quantity = Int()
    var discountType = DiscountType.fixed
    var discountAmount = Double()
    var total = Double()
    var notes = String()
    var itemID = String()
}


