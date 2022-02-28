//
//  ViewController.swift
//  FetchDataInTableView
//
//  Created by muhammad hassan on 27/02/2022.
//

import UIKit

struct jsonData: Decodable
{
    let name: String
    let fathername: String
}

class ViewController: UIViewController {
    
    var ListOfMissingPerson = [jsonData]()

    @IBOutlet weak var TableViewS: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GetData()
        
        TableViewS.delegate = self
        TableViewS.dataSource = self
        
        
    }
    func GetData()
    {
        let url = URL(string: "https://missingpersonapps.000webhostapp.com/fetch_user_data2.php")
        URLSession.shared.dataTask(with: url!) { (Data,response,error) in
            do
            {  if error == nil
                {  self.ListOfMissingPerson = try
                JSONDecoder().decode([jsonData].self, from: Data!)
            
                for _ in self.ListOfMissingPerson
                {
                    
                    DispatchQueue.main.async {
                        self.TableViewS.reloadData()
                    }
                }
            }
          }
            catch
            { print("error in loadind json data") }
        }.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ListOfMissingPerson.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableViewS.dequeueReusableCell(withIdentifier: "CustomCellTableViewCell", for: indexPath) as! CustomCellTableViewCell
        cell.lblName.text = "Name: \(ListOfMissingPerson[indexPath.row].name)"
        cell.lblFatherName.text = "F.Name: \(ListOfMissingPerson[indexPath.row].fathername)"
        
        return cell
    }
    
    
}

