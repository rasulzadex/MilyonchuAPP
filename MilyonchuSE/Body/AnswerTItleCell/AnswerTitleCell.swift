//
//  AnswerTitleCell.swift
//  BillionerProject
//
//

import UIKit

class AnswerTitleCell: UICollectionViewCell {
    @IBOutlet private weak var answerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(model: Answer) {
        answerLabel.text = model.title
    }
}
