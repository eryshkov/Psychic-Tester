//
//  CardViewController.swift
//  Psychic Tester
//
//  Created by Evgeniy Ryshkov on 11/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    //MARK: -
    weak var delegate: ViewController!
    
    var front: UIImageView!
    var back: UIImageView!
    
    var isCorrect = false
    
    //MARK: -
    @objc func cardTapped() {
        delegate.cardTapped(self)
    }
    
    func wasTapped() {
        UIView.transition(with: view, duration: 0.7, options: [.transitionFlipFromRight], animations: {[unowned self] in
            self.back.isHidden = true
            self.front.isHidden = false
        }, completion: nil)
    }
    
    @objc func wasntTapped() {
        UIView.animate(withDuration: 0.7) {
            self.view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            self.view.alpha = 0
        }
    }
    
    @objc func wiggle() {
        if Int.random(in: 0 ... 3) == 1 {
            UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction, animations: {[unowned self] in
                self.back.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
            }) {[unowned self] _ in
                self.back.transform = CGAffineTransform.identity
            }
            perform(#selector(wiggle), with: nil, afterDelay: 8)
        }else{
            perform(#selector(wiggle), with: nil, afterDelay: 2)
        }
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()

        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 140)
        front = UIImageView(image: UIImage(named: "cardBack"))
        back = UIImageView(image: UIImage(named: "cardBack"))
        
        view.addSubview(front)
        view.addSubview(back)
        
        front.isHidden = true
        back.alpha = 0
        
        UIView.animate(withDuration: 0.2) {[unowned self] in
            self.back.alpha = 1
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        back.isUserInteractionEnabled = true
        back.addGestureRecognizer(tap)
        
        perform(#selector(wiggle), with: nil, afterDelay: 1)
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
