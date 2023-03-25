//
//  DevicesViewController.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//  
//

import UIKit
import CoreBluetooth

protocol DevicesDisplayLogic {
    func displaySomething(viewModel: Devices.Something.ViewModel)
}

class DevicesViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var devicesTableV: UITableView!
    
    // MARK: - Variables
    
    var interactor: DevicesBusinessLogic?
    var router: DevicesRoutingLogic?
    var centralManager: CBCentralManager?
    var peripheralList: [CBPeripheral] = []
    
    
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
        configureTable()
        centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
    // MARK: - Configurators
    
    fileprivate func setup() {
        
        let viewcontroller   = self
        let interactor      = DevicesInteractor()
        let presenter       = DevicesPresenter()
        let router          = DevicesRouter()
        
        viewcontroller.interactor = interactor
        viewcontroller.router     = router
        interactor.presenter      = presenter
        presenter.view            = viewcontroller
        router.view               = viewcontroller
    }
    
    fileprivate func configureTable() {
        devicesTableV.register(UINib(nibName: "DeviceCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: DeviceCellTableViewCell.identifier)
        devicesTableV.dataSource = self
    }
    
    // MARK: - Private
    
    
    // MARK: - Actions
    
    
}

extension DevicesViewController: DevicesDisplayLogic {
    func displaySomething(viewModel: Devices.Something.ViewModel) {}
}

extension DevicesViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            centralManager?.scanForPeripherals(withServices: nil)
        default:
            print("faild")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)  {
            print("peripheral \(peripheral)")
        if !peripheralList.contains(peripheral) {
            peripheralList.append(peripheral)
            DispatchQueue.main.async {
                self.devicesTableV.reloadData()
            }
        }
    }
    
    
}

extension DevicesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripheralList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:  DeviceCellTableViewCell.identifier, for: indexPath) as? DeviceCellTableViewCell {
            cell.titleLbl.text = peripheralList[indexPath.row].name ?? "Unknow Name"
            cell.identifierLbl.text = peripheralList[indexPath.row].identifier.debugDescription
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
