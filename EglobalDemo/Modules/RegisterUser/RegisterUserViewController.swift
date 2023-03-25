//
//  RegisterUserViewController.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

protocol RegisterUserDisplayLogic {
    func displayRegister(response: String)
    func displayError(error: RequestError)
}

class RegisterUserViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstNameLbl: UITextField!
    
    @IBOutlet weak var lastNameLbl: UITextField!
    
    @IBOutlet weak var ageLbl: UITextField!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    // MARK: - Variables
    
    var interactor: RegisterUserBusinessLogic?
    var router: RegisterUserRoutingLogic?
    
    // MARK: - Object Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Configurators
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = RegisterUserInteractor()
        let presenter       = RegisterUserPresenter()
        let router          = RegisterUserRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    // MARK: - Private
    
    
    // MARK: - Actions
    
    @IBAction func registerAction(_ sender: Any) {
        interactor?.registerUser(firstName: firstNameLbl.text, lastName: lastNameLbl.text, age: Int(ageLbl.text ?? "0"))
    }
    
    
}

extension RegisterUserViewController: RegisterUserDisplayLogic {
    func displayRegister(response: String) {
        self.presentSingleAlert(title: "Succes", message: response)
    }
    
    func displayError(error: RequestError) {
        self.presentSingleAlert(title: "Error", message: error.statusMessage)
    }
}
