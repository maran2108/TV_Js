//
//  ViewController.swift
//  JsonProj-1
//
//  Created by Rifluxyss on 09/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var x = [AllData]()
   
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myEditBtn: UIBarButtonItem!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        downloadJSON {
            print("-----completed-----")
            self.myTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return x.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "t1") as! TVCell
        cell.idLabel.text = String(x[indexPath.row].id)
//        cell.nameLabel.text = x[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Start"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "End"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "sc") as! SecondViewController
        vc.id_data = x[indexPath.row].id
        vc.name_data = x[indexPath.row].name
        vc.userName_data = x[indexPath.row].username
        vc.email_data = x[indexPath.row].email
        vc.phone_data = x[indexPath.row].phone
        vc.website_data = x[indexPath.row].website
        // address
        vc.street_data = x[indexPath.row].address.street
        vc.suite_data = x[indexPath.row].address.suite
        vc.city_data = x[indexPath.row].address.city
        vc.zipcode_data = x[indexPath.row].address.zipcode
        // geo
        vc.lat_data = x[indexPath.row].address.geo.lat
        vc.lng_data = x[indexPath.row].address.geo.lng
        //company details
        vc.companyName_data = x[indexPath.row].company.name
        vc.companyPharse_data = x[indexPath.row].company.catchPhrase
        vc.companyBs_data = x[indexPath.row].company.bs
        navigationController?.show(vc, sender: self)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // delete row
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        myTableView.beginUpdates()
        let d1 = AllData(id: indexPath.row + 2, name: "", username: "", email: "", address: addressDetails(street: "", suite: "", city: "", zipcode: "", geo: geoDetails(lat: "", lng: "")), phone: "", website: "", company: companyDetails(name: "", catchPhrase: "", bs: ""))
        x.insert(d1 , at: indexPath.row)
        myTableView.insertRows(at: [indexPath], with: .bottom)
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].id)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].name)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].username)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].email)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].phone)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].website)
        }
        // address
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].address.street)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].address.suite)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].address.city)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].address.zipcode)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].address.geo.lat)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].address.geo.lng)
        }
        // company
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].company.name)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].company.catchPhrase)
        }
        alert.addTextField { (textField) in
            textField.text = String(self.x[indexPath.row].company.bs)
        }
        let saveAction = UIAlertAction(title: "save", style: .default, handler:  { (action) in
            let idField = alert.textFields![0]
            let nameField = alert.textFields![1]
            alert.textFields![1].placeholder = "enter the name"
            let userNameField = alert.textFields![2]
            let emailField = alert.textFields![3]
            let phoneField = alert.textFields![4]
            let websiteField = alert.textFields![5]
            let streetField = alert.textFields![6]
            let SuiteField = alert.textFields![7]
            let cityField = alert.textFields![8]
            let zipcodeField = alert.textFields![9]
            let latField = alert.textFields![10]
            let lngField = alert.textFields![11]
            let cNameField = alert.textFields![12]
            let phraseField = alert.textFields![13]
            let bsField = alert.textFields![14]
            self.x[indexPath.row].id = Int(idField.text!)!
            self.x[indexPath.row].name = nameField.text!
            self.x[indexPath.row].username = userNameField.text!
            self.x[indexPath.row].email = emailField.text!
            self.x[indexPath.row].phone = phoneField.text!
            self.x[indexPath.row].website = websiteField.text!
            self.x[indexPath.row].address.street = streetField.text!
            self.x[indexPath.row].address.suite = SuiteField.text!
            self.x[indexPath.row].address.city = cityField.text!
            self.x[indexPath.row].address.zipcode = zipcodeField.text!
            self.x[indexPath.row].address.geo.lat = latField.text!
            self.x[indexPath.row].address.geo.lng = lngField.text!
            self.x[indexPath.row].company.name = cNameField.text!
            self.x[indexPath.row].company.catchPhrase = phraseField.text!
            self.x[indexPath.row].company.bs = bsField.text!
        })
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        myTableView.endUpdates()       
    }
    
    // re- order
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let i = x[sourceIndexPath.row]
        x.remove(at: sourceIndexPath.row)
        x.insert(i, at: destinationIndexPath.row)
    }
     
    
    @IBAction func edit(_ sender: Any) {
        myTableView.isEditing = !myTableView.isEditing
        switch myTableView.isEditing {
        case true:
            myEditBtn.title = "Done"
        case false:
            myEditBtn.title = "edit"
        }
    }   
    
    func downloadJSON(completed: @escaping () -> ()){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users#")
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            if let data = data {
                print("-------->\(data)<--------")
                do {
                    self.x = try JSONDecoder().decode([AllData].self, from: data)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("error--->")
                }
            }
        } .resume()
       
    }


}

