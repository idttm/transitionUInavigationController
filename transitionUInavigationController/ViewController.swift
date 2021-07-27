//
//  ViewController.swift
//  transitionUInavigationController
//
//  Created by Andrew Cheberyako on 23.07.2021.
//

import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
//        self.redView.hero.isEnabled = true
//        view.heroID = "view"
        view.backgroundColor = .green
//        redView.backgroundColor = .gray
//        view.hero.modifiers = [.translate(y:100)]
        // Do any additional setup after loading the view.
    }
    

   

}
