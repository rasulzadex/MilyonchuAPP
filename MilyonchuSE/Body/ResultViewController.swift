//
//  ResultViewController.swift
//  MilyonchuSE
//
//  Created by Javidan on 13.10.24.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet private weak var curveView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curveViewCheck()
        
        
        // Do any additional setup after loading the view.
    }
    

    
    func curveViewCheck(){
        curveView.layer.cornerRadius = 215
        
        
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
