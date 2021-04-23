//
//  ChoiceViewController.swift
//  Transformers Card Game
//
//  Created by Thomas Mazza on 4/22/21.
//

import UIKit

//Step 1
protocol ChoiceSelectionDelegate: AnyObject {
    func factionWasSelected(faction: String)
    
}

class ChoiceViewController: UIViewController {

    // Properties
    weak var delegate: ChoiceSelectionDelegate?
    
    // Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK - Actions
    
    @IBAction func autobotButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "autobots")
        self.dismiss(animated:true)
        
        
    }
    @IBAction func decepticonButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "decpeticons")
        self.dismiss(animated:true)
        
    }
    
        
    }//end of class
