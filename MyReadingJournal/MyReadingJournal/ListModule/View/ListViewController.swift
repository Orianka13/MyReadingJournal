//
//  ListViewController.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 11.10.2022.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIElements()
    }
    @IBAction func openMenu(_ sender: UIBarButtonItem) {
    }
    @IBAction func startSearch(_ sender: UIBarButtonItem) {
    }
    @IBAction func startSort(_ sender: UIBarButtonItem) {
    }
    @IBAction func addNewBook(_ sender: UIButton) {
    }
    
    private func setUIElements() {
        title = "My Reading Journal"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addButton.setTitle("", for: .normal)
        self.addButton.tintColor = UIColor(red: 1 / 255, green: 93 / 255, blue: 104 / 255, alpha: 1)
        self.tabBar.selectedItem = tabBar.items?.first
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        
        return cell
    }
}
