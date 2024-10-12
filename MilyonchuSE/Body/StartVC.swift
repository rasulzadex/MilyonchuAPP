    //
//  ViewController.swift
//  MilyonchuSE
//
//  Created by Javidan on 08.10.24.
//

import UIKit

class StartVC: UIViewController {

    @IBOutlet private weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if navigationController == nil {
            print("Navigation controller is nil")
        } else {
            print("Navigation controller is available")
            let storyboard = UIStoryboard(name: "Body", bundle: nil)
            if let questionsVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
                navigationController?.pushViewController(questionsVC, animated: true)
            }
        }
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
