//
//  StartViewController.swift
//  Lesson13
//
//  Created by Robert Argume on 2018-04-23.
//  Copyright © 2018 Robert Argume. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var EndScreenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        
        AnimateLabelIn()
        AnimateBackButtonIn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        EndScreenLabel.alpha=0
        BackButton.isHidden=true
        
    }
    
    func AnimateLabelIn() {
        
        UIView.animate(withDuration: 1, delay: 0, options:[], animations:{
            
            self.EndScreenLabel.alpha = 1
            self.EndScreenLabel.center.y -= 200
            
            //self.StartViewLabel.frame.size = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 2, options:[.repeat, .autoreverse], animations:{
            
            self.EndScreenLabel.center.y += 200
            
            //self.StartViewLabel.frame.size = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
    }
    
    func AnimateBackButtonIn() {
        UIView.transition(with: BackButton, duration: 2, options: [.transitionFlipFromTop], animations: {
            self.BackButton.isHidden = false
            
        }, completion: MoveBackButtonOver )
    }
    
    func MoveBackButtonOver(a: Bool){
        UIView.animate(withDuration: 1, delay: 0.25, options: [.curveEaseIn], animations: {
            self.BackButton.center.x -= 125
        }, completion: nil)
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.SecondView, sender: sender)
    }
    
}


