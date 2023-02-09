//
//  ViewController.swift
//  UserDefault
//
//  Created by Ary Sugiarto on 09/02/23.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var createButton: RoundButton!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var profesionlabel: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        createButton.pinkColor()
    }


    @IBAction func createAction(_ sender: Any) {
        if  let name = nameLabel.text, let email = emailLabel.text, let profesion = profesionlabel.text{
            if name.isEmpty {
                textEmpty("Name")
            }else if email.isEmpty{
                textEmpty("Email")
            }else if profesion.isEmpty{
                textEmpty("Profesion")
            }else{
                savedProfile(name,email,profesion)
                self.performSegue(withIdentifier: "moveToHome", sender: self)
            }
        }
    }
    
    func savedProfile(_ name: String, _ email: String, _ profesion: String ){
        ProfileModel.stateLogin = true
        ProfileModel.name = name
        ProfileModel.email = email
        ProfileModel.profesion = profesion
        
    }
    
    func textEmpty(_ field: String) {
            let alert = UIAlertController(
                title: "Alert",
                message: "\(field) is empty",
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
}

