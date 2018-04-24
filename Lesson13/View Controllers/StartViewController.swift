//
//  StartViewController.swift
//  Lesson13
//
//  Created by Robert Argume on 2018-04-23.
//  Copyright © 2018 Robert Argume. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var StartViewLabel: UILabel!
    
    
    @IBOutlet weak var NextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    override func viewDidAppear(_ animated: Bool) {
        AnimateLabelIn()
        AnimateButtonIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        StartViewLabel.alpha = 0
        NextButton.isHidden = true
    }
    
    func AnimateLabelIn(){
        UIView.animate(withDuration: 1, delay: 0.25, options:[.curveEaseInOut], animations:{
            self.StartViewLabel.alpha = 1
            self.StartViewLabel.center.y -= 50
            //self.StartViewLabel.frame.size = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
    }
    
    func AnimateButtonIn(){
        UIView.transition(with: NextButton, duration: 2, options: [.transitionFlipFromTop], animations: {
                self.NextButton.isHidden = false
            
            }, completion: MoveButtonOver )
    }
    
    func MoveButtonOver(a: Bool){
        UIView.animate(withDuration: 1, delay: 0.25, options: [.curveEaseIn], animations: {
            self.NextButton.center.x += 125
            }, completion: nil)
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.SecondView, sender: sender)
    }
}

