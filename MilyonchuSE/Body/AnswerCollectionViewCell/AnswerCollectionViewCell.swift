//
//  AnswerCollectionViewCell.swift
//  BillionerProject
//
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var collection: UICollectionView!
    private var question: Question?
    
    var singleTouchIsEnabled = false
    var resultList = [""]
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }
    
    fileprivate func configureCollection() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "AnswerTitleCell", bundle: nil), forCellWithReuseIdentifier: "AnswerTitleCell")
        collection.register(UINib(nibName: "QuestionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QuestionHeaderView")
        collection.layer.cornerRadius = 15
        collection.backgroundColor = .clear    }
    
    func configureCell(model: Question) {
        question = model
        reloadCollection()
    }
    
    fileprivate func reloadCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    
}

extension AnswerCollectionViewCell: UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        question?.answer.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerTitleCell", for: indexPath) as! AnswerTitleCell
        guard let answer = question?.answer[indexPath.row] else {return UICollectionViewCell()}
        cell.configureCell(model: answer)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width/1 - 12, height: collectionView.frame.height/10 - 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width/2-24, height: collectionView.frame.height/3-32)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "QuestionHeaderView", for: indexPath) as! QuestionHeaderView
            guard let model = question else {return UICollectionReusableView()}
            header.configureView(model: model)
            return header
        default:
            return UICollectionReusableView()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !singleTouchIsEnabled else {return}
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnswerTitleCell,
            let answer = question?.answer[indexPath.row] else {return}
            cell.answerLabel.layer.borderColor = UIColor.gray.cgColor

            

        cell.layer.cornerRadius = 10

        
        
        if let answer = question?.answer[indexPath.row] {

                if answer.correct {
                    cell.answerLabel.layer.borderColor = UIColor.appGreen.cgColor
                    cell.answerLabel.backgroundColor = .answerGreen
                    correctAnswersFunc()
                } else {
                    cell.answerLabel.layer.borderColor = UIColor.red.cgColor
                    cell.answerLabel.backgroundColor = .answerRed

                    

                }
            singleTouchIsEnabled = true
          
//                collection.backgroundColor = answer.correct ? UIColor.green.withAlphaComponent(0.2) : UIColor.red.withAlphaComponent(0.2)
//            collection.layer.cornerRadius = 10.0
//                collection.layer.borderWidth = 5
//                collection.layer.borderColor = answer.correct ? UIColor.appGreen.cgColor : UIColor.red.cgColor
            }
      
    
            
//
//
//        print(#function, answer, indexPath.row)
    }
    
    func correctAnswersFunc(){
        var correctAnswers = 0

        
        correctAnswers += 1
        print(correctAnswers)

    }
    


    
}

