//
//  MainViewController.swift
//  Tipsy
//
//  Created by Prosper Evergreen on 02.07.2020.
//  Copyright © 2020 proSPEC. All rights reserved.
//

import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class MainViewController: UIViewController {

    @IBOutlet weak var billInputLabel: UITextField!
    @IBOutlet weak var splitCounterLabel: UILabel!
    @IBOutlet var selectTipBtn: [UIButton]!
    var tipEngine = TipEngine()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipPercentBtnPressed(_ sender: UIButton) {
        for btn in selectTipBtn{
            btn.backgroundColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0)
            btn.setTitleColor(#colorLiteral(red: 0, green: 0.7064647675, blue: 0.3913369179, alpha: 1), for: .normal)
            }
        sender.backgroundColor = #colorLiteral(red: 0, green: 0.7108028531, blue: 0.3476296365, alpha: 1)
        sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        tipEngine.setTip(tip: sender.currentTitle!)
    }
    

    @IBAction func initCostLabel(_ sender: UITextField) {
        if (sender.text!.count > 10) {
            sender.deleteBackward()
        }
    }
    @IBAction func stepperBtnPressed(_ sender: UIStepper) {
        tipEngine.splitCounter = Int(sender.value)
        splitCounterLabel.text = String(tipEngine.splitCounter)
    }
    
    @IBAction func calculateTipBtn(_ sender: UIButton) {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: billInputLabel.text!)
        tipEngine.initCost = number?.floatValue
        self.performSegue(withIdentifier: "goToResultPage", sender: self)
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResultPage"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.tipEng = tipEngine
        }
        
    }
    

}
