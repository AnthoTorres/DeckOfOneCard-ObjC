//
//  CardViewController.swift
//  DeckOfOneCard-C
//
//  Created by Anthony Torres on 12/3/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var suitCardLabel:UILabel!
    @IBOutlet weak var valueCardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawNewCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        JATCardController.shared().drawNewCards(1) { (cards) in
            guard let card = cards?.first
                else { return }
            
            JATCardController.shared().fetchImage(from: card) { (cardImage) in
                guard let image = cardImage
                    else { return }
                
                DispatchQueue.main.async {
                    self.suitCardLabel.text = card.suit
                    self.valueCardLabel.text = card.value
                    self.cardImageView.image = image
                }
            }
        }
    }
}
