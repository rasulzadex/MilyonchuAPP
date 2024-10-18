import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var nextQuestionButton: UIButton!
    
    var correctCounter = 0
    private var questions: [Question] = []
    private var currentQuestionIndex = 0 
    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestions()
        configureView()
        UserDefaultsHelper.setInteger(key: UserDefaultsKey.loginType.rawValue, value: 2)

    }

    fileprivate func configureView() {
        configureCollection()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    fileprivate func configureCollection() {
        nextQuestionButton.layer.cornerRadius = 15
        collection.layer.cornerRadius = 15
        collection.backgroundColor = .clear

        nextQuestionButton.setTitle("Next", for:.normal)

        collection.delegate = self
        collection.dataSource = self
        collection.isScrollEnabled = false
        collection.register(UINib(nibName: "AnswerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCollectionViewCell")
        
        
    }
    
    fileprivate func generateQuestions() {
        questions = [
            Question(
                title: "What is the capital of France?",
                answer: [
                    Answer(title: "Berlin", correct: false),
                    Answer(title: "Madrid", correct: false),
                    Answer(title: "Paris", correct: true),
                    Answer(title: "Rome", correct: false)
                ]
            ),
            Question(
                title: "Which planet is known as the Red Planet?",
                answer: [
                    Answer(title: "Earth", correct: false),
                    Answer(title: "Mars", correct: true),
                    Answer(title: "Jupiter", correct: false),
                    Answer(title: "Venus", correct: false)
                ]
            ),
            Question(
                title: "Who wrote the play 'Romeo and Juliet'?",
                answer: [
                    Answer(title: "Charles Dickens", correct: false),
                    Answer(title: "William Shakespeare", correct: true),
                    Answer(title: "Mark Twain", correct: false),
                    Answer(title: "Jane Austen", correct: false)
                ]
            ),
        ]

        reloadCollection()
    }
    
    fileprivate func reloadCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    @IBAction func nextQuestionButtonTapped(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 0) // Cavabın olduğu hüceyrənin indeks yolu
        if let cell = collection.cellForItem(at: indexPath) as? AnswerTitleCell {
            let answer = cell.answerLabel.text
//            print(answer)

        }

        
        currentQuestionIndex += 1
        
        
        
        
        if currentQuestionIndex < questions.count {
            let indexPath = IndexPath(item: currentQuestionIndex, section: 0)
            collection.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
            if currentQuestionIndex == questions.count-1{
                nextQuestionButton.setTitle("Submit", for:.normal)

                
            }
        } else {
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            navigationController?.pushViewController(nextVC, animated: true)
            
        }
    }
}

extension MainViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionViewCell", for: indexPath) as! AnswerCollectionViewCell
        let model = questions[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 48, height: collectionView.frame.height - 24)
    }
    
    
   
    
    
    
}


