//
//  CustomerViewCell.swift
//  Rabo
//
//  Created by iSparshIT on 28/04/22.
//

import UIKit

class CustomerViewCell: UICollectionViewCell, NibInstantiatable {

    @IBOutlet private weak var borderedView: BorderedView? {
        didSet {
            borderedView?.borderColor = UIColor.gray.cgColor
        }
    }

    @IBOutlet private weak var titleLabel: UILabel?

    var viewModel: CustomerViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            titleLabel?.text = viewModel.name
            titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            titleLabel?.numberOfLines = 0
            borderedView?.borderSides = viewModel.borderSides
        }
    }
}

