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
        self.isHeroEnabled = true
        view.heroID = "id"
        view.backgroundColor = .red
//        redView.backgroundColor = .gray
//        view.hero.modifiers = [.translate(y:100)]
        // Do any additional setup after loading the view.
    }
    

   

}
