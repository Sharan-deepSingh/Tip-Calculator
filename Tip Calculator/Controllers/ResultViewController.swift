//
//  ResultViewController.swift
//  Tip Calculator
//
//  Created by user on 05/06/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    var amountPerPerson: Float?
    var tipPercent: String?
    var numberOfPerson: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = String(format: "%.2f", amountPerPerson ?? 0.0)
        outputLabel.text = "Split between \(numberOfPerson ?? "0") people, with \(tipPercent ?? "0")% tip"
    }
    

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
