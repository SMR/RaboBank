//
//  CustomerListViewModel.swift
//  Rabo
//
//  Created by iSparshIT on 28/04/22.
//

import Foundation

struct CustomerListViewModel {
    /// List of Customers
    let customers: [Customer]
}

extension BorderLayer.Side {
    /// Return border sides for given index path
    /// This is related to customer list view with given items per row
    static func border(at indexPath: IndexPath,
                       itemsInRow: Int = BaseCollectionViewController.Constants.itemsInRow) -> BorderLayer.Side {
        var result: BorderLayer.Side = [.bottom, .right]
        if indexPath.row < itemsInRow {
            result.insert(.top)
        }
        if indexPath.row % itemsInRow == 0 {
            result.insert([.left])
        }
        return result
    }
}

