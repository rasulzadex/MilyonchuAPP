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
        questionLabel.layer.cornerRadius = 10
//        questionLabel.layer.borderWidth  = 2
        questionLabel.layer.borderColor  = UIColor.black.cgColor
        questionLabel.layer.backgroundColor = UIColor.white.cgColor
        questionLabel.backgroundColor = .clear
        

        
    }
}
