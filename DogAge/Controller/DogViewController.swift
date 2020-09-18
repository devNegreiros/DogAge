//
//  DogViewController.swift
//  DogAge
//
//  Created by Daniel Negreiros on 17/09/20.
//

import UIKit
import ProgressHUD

class DogViewController: UIViewController {
    
    var dogModel = DogModel()
    var age = 0
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var screenStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        screenStackView.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func tableViewTapped(){
        ageTextField.endEditing(true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if let ageText = ageTextField.text{
            if let ageInt = Int(ageText){
                age = dogModel.caculateHumanAge(dogAge: ageInt)
                updateUI()
            } else{
                ProgressHUD.showError("Erro!")
            }
        } else{
            ProgressHUD.showError("Erro!")
        }
    }
    
    func updateUI(){
        responseLabel.isHidden = false
        responseLabel.text = "A idade do cachorro em anos humanos é: \(age)"
    }
}
