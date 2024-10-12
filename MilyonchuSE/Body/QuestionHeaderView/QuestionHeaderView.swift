//
//  QuestionHeaderView.swift
//  BillionerProject
//
//

import UIKit

class QuestionHeaderView: UICollectionReusableView {
    @IBOutlet private weak var questionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureView(model: Question) {
        questionLabel.text = model.title
    }
}
