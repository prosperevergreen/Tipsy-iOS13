//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Prosper Evergreen on 02.07.2020.
//  Copyright © 2020 proSPEC. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var tipEng: TipEngine?
    @IBOutlet weak var costPerPersonLabel: UILabel!
    @IBOutlet weak var splitCounterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        costPerPersonLabel.text =  String(format: "%.2f", tipEng?.costPerPerson() as! CVarArg)
        splitCounterLabel.text = "Split between \(tipEng?.splitCounter ?? 2) people, with \(Int(tipEng!.tipPct * 100))% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
