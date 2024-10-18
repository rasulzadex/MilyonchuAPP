//
//  AnswerTitleCell.swift
//  BillionerProject
//
//

import UIKit

class AnswerTitleCell: UICollectionViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    var answerCorrect = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView()
    }
    
    func configureCell(model: Answer) {
        answerLabel.text = model.title
    }
    
    func cellView() {
        answerLabel.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        answerLabel.layer.cornerRadius = 10
        answerLabel.layer.borderWidth = 1
        answerLabel.backgroundColor = .clear
        answerLabel.layer.backgroundColor = UIColor.white.cgColor
        answerLabel.layer.shadowRadius = 10
    
    }
    
}
        
        
    
     

    
    
    
    
    

