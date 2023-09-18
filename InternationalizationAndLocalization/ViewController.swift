//
//  ViewController.swift
//  InternationalizationAndLocalization
//
//  Created by Srinath Shah on 9/16/23.
//

import UIKit
 
class ViewController: UIViewController {
    
    let applesKey = "Here's apples"
    
    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let count = 1
        let spellOutFormatter = NumberFormatter.SpellOutNumberFormatter()
        let value = spellOutFormatter.string(for: 1)! //one
        
        let plularizedString = String.localizedStringWithFormat(NSLocalizedString(applesKey, comment: "tell user about the number of apples that are available."), value, 1)
        label.text = String(format: plularizedString, spellOutFormatter)
        button.setTitle(NSLocalizedString("Generate Random Number", comment: "Generate Random Number"), for: .normal)
        imageView.image = .init(named:NSLocalizedString("image", comment: "DO NOT CHANGE THIS"))
    }
    
    @IBAction
    func generateRandomNumber() {
        
       
        let random: Int = Int.random(in: 0...2)
        let spelled = NumberFormatter.SpellOutNumberFormatter().string(for: random)!
        let string = NSLocalizedString(applesKey, comment: "tell user about the number of apples that are available.")
        label.text = String.localizedStringWithFormat(string, spelled, random)
        let localizedImage = UIImage(named: NSLocalizedString("image", comment: "image"))!
        imageView.image = localizedImage
    }
    
}

extension NumberFormatter {
    static func SpellOutNumberFormatter() -> Self {
        let nf = Self()
        nf.numberStyle = .spellOut
        return nf
    }
}
