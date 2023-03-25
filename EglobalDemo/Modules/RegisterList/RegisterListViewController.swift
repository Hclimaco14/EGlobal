//
//  RegisterListViewController.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit

protocol RegisterListDisplayLogic {
    
}

class RegisterListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var registerTableV: UITableView!
    
    // MARK: - Variables
    
    var interactor: RegisterListBusinessLogic?
    var router: RegisterListRoutingLogic?
    
    var users:[RegisterUser.ViewModel] = []
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
        registerTableV.register(UINib(nibName: "RegisterCell", bundle: Bundle.main), forCellReuseIdentifier: RegisterCell.identifier)
        registerTableV.dataSource = self
        users = CoreDataManager.shared.getUsers()
        registerTableV.reloadData()
    }
    
    // MARK: - Configurators
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = RegisterListInteractor()
        let presenter       = RegisterListPresenter()
        let router          = RegisterListRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    // MARK: - Private
    
    
    // MARK: - Actions
    
}
extension RegisterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.identifier, for: indexPath) as? RegisterCell {
            cell.firstNameLbl.text = users[indexPath.row].firstName ?? "Firts Name"
            cell.lastNameLbl.text = users[indexPath.row].lastName ?? "Last Name"
            cell.ageLbl.text = users[indexPath.row].age ?? "Age"
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let user = users[indexPath.row]
        interactor?.deleteUser(user: user)
        self.users.remove(at: indexPath.row)
        self.registerTableV.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    
}

extension RegisterListViewController: RegisterListDisplayLogic {
    
}
