//
//  MenuViewController.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//  
//

import UIKit
import CoreBluetooth

protocol MenuDisplayLogic {
    func displaySomething(viewModel: Menu.Something.ViewModel)
}

class MenuViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scanDevicesBtn: UIButton!
    
    @IBOutlet weak var sendInformationBtn: UIButton!
    
    @IBOutlet weak var listRequestBtn: UIButton!
    // MARK: - Variables
    
    var interactor: MenuBusinessLogic?
    var router: MenuRoutingLogic?

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
        configueView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    // MARK: - Configurators
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = MenuInteractor()
        let presenter       = MenuPresenter()
        let router          = MenuRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    fileprivate func configueView() {
        DispatchQueue.main.async {
            self.configureButton(button: self.scanDevicesBtn)
            self.configureButton(button: self.sendInformationBtn)
            self.configureButton(button: self.listRequestBtn)
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
    
    
    @IBAction func scanDevicesAction(_ sender: Any) {
        router?.routeToDevices()
    }
    
    @IBAction func sendInformationAction(_ sender: Any) {
        router?.routeToRegister()
    }
    
    @IBAction func listRequestAction(_ sender: Any) {
        router?.routeToListUser()
    }
    
}

extension MenuViewController: MenuDisplayLogic {
    func displaySomething(viewModel: Menu.Something.ViewModel) {}
}
