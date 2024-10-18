    //
//  ViewController.swift
//  MilyonchuSE
//
//  Created by Javidan on 08.10.24.
//

import UIKit

class StartVC: UIViewController {
    
    @IBOutlet private weak var quizView: UIView!
    @IBOutlet private weak var quizLabel: UILabel!
    @IBOutlet private weak var kheloLabel: UILabel!
    @IBOutlet private weak var enterNameLabel: UILabel!
    @IBOutlet private weak var enterNameTF: UITextField!





    @IBOutlet private weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            adjustCorners()

    }
    
    
    private func adjustCorners(){
        quizView.layer.cornerRadius = 70
        enterNameTF.layer.borderWidth = 1
        enterNameTF.layer.cornerRadius = 15
        enterNameTF.layer.borderColor = UIColor.white.cgColor
        let textField = UITextField()
        let placeholderText = "Javidan..."
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        enterNameTF.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)

        
        startButton.layer.cornerRadius = 15
        
        
        
    }

    
    @IBAction func startButtonTapped(_ sender: UIButton) {
     
            print("Navigation controller is available")
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            navigationController?.pushViewController(nextVC, animated: true)
        
    }




    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
