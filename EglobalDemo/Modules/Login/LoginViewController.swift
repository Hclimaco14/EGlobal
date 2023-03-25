//
//  LoginViewController.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//

import UIKit

protocol LoginDisplayLogic {
    func displayLoginSuccess()
    func displayError(error: RequestError)
}

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var logoImgView: UIImageView!
    
    @IBOutlet weak var userTextF: UITextField!
    
    @IBOutlet weak var passwordTextF: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - Variables
    
    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?
    
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
        configureView()
    }
    
    // MARK: - Configurators
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = LoginInteractor()
        let presenter       = LoginPresenter()
        let router          = LoginRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    fileprivate func configureView() {
        DispatchQueue.main.async {
            self.configureButton(button: self.loginBtn)
        }
    }
    
    fileprivate func configureButton(button: UIButton){
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.tintColor = UIColor.black
        button.applyGradient(colours: [UIColor.lightGray,
                                             UIColor.gray,
                                             UIColor.lightGray,])
    }
    // MARK: - Private
    
    // MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
        let user = userTextF.text
        let password = passwordTextF.text
        interactor?.getLogin(user: user, password: password)
    }
    
}

extension LoginViewController: LoginDisplayLogic {
    func displayLoginSuccess() {
        router?.routeToMenu()
    }
    
    func displayError(error: RequestError) {
        self.presentSingleAlert(title: "Error", message: error.statusMessage)
    }
}
