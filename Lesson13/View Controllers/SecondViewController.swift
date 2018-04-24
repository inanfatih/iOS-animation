//
//  StartViewController.swift
//  Lesson13
//
//  Created by Robert Argume on 2018-04-23.
//  Copyright © 2018 Robert Argume. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var SecondScreenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        
        AnimateLabelIn()
        AnimateNextButtonIn()
        AnimateBackButtonIn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SecondScreenLabel.alpha=0
        NextButton.isHidden=true
        BackButton.isHidden=true
    }
    
    func AnimateLabelIn() {
        UIView.animate(withDuration: 2, delay: 0.25, options:[], animations:{
            self.SecondScreenLabel.alpha = 1
            self.SecondScreenLabel.center.y -= 250
            //self.StartViewLabel.frame.size = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 2, options:[.repeat, .autoreverse], animations:{
            self.SecondScreenLabel.alpha = 0
            //self.StartViewLabel.frame.size = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
    }
    
    func AnimateNextButtonIn() {
        UIView.transition(with: NextButton, duration: 2, options: [.transitionFlipFromTop], animations: {
            self.NextButton.isHidden = false
            
        }, completion: MoveNextButtonOver )
    }
    
    func MoveNextButtonOver(a: Bool){
        UIView.animate(withDuration: 1, delay: 0.25, options: [.curveEaseIn], animations: {
            self.NextButton.center.x += 200
        }, completion: nil)
    }
    
    func AnimateBackButtonIn() {
        UIView.transition(with: BackButton, duration: 2, options: [.transitionFlipFromTop], animations: {
            self.BackButton.isHidden = false
            
        }, completion: MoveBackButtonOver )
    }
    
    func MoveBackButtonOver(a: Bool){
        UIView.animate(withDuration: 1, delay: 0.25, options: [.curveEaseIn], animations: {
            self.BackButton.center.x -= 200
        }, completion: nil)
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.StartView, sender: sender)
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueManager.EndView, sender: sender)
    }
}


