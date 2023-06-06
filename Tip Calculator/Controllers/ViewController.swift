//
//  ViewController.swift
//  Tip Calculator
//
//  Created by user on 05/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenTip: UIButton!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var twentyTip: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var totalBill = 0.0
    var tipPercent = 0
    var tipAmount = 0.0
    var payableAmount = 0.0
    var amountPerPerson = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        updateUI()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func updateUI() {
        zeroTip.isSelected = false
        tenTip.isSelected = true
        twentyTip.isSelected = false
    }
    
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        tipPercent = Int((sender.currentTitle ?? "0").dropLast()) ?? 0
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        sender.isSelected = true
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        totalBill = Double(billTextField.text ?? "0.0") ?? 0.0
        tipAmount = (totalBill / 100.0) * Double(tipPercent)
        payableAmount = totalBill + tipAmount
        amountPerPerson = payableAmount / Double(stepperLabel.text ?? "0.0")!
        performSegue(withIdentifier: "goToResultPage", sender: self)
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        view.endEditing(true)
        stepperLabel.text = String(Int(sender.value))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.amountPerPerson = Float(self.amountPerPerson)
        destinationVC.tipPercent = String(tipPercent)
        destinationVC.numberOfPerson = stepperLabel.text ?? "0.0"
    }
}

