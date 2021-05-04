//
//  ParsedJsonTableViewController.swift
//  NestedparsedJson(seatGeekAPI)
//
//  Created by Pramela on 4/27/21.
//

import UIKit
import Kingfisher

class ParsedJsonTableViewController: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate,UITextFieldDelegate {

    let searchController = UISearchController()
    var responseArray = [JasonResponse]()
    var filteredData = [JasonResponse]()
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else {
            return
        }
        filterText(text)

        print(text)
    }
    func filterText (_ query : String?){
        
        guard let query = query else {return}
        filteredData.removeAll()
        for jasonresp in responseArray
        {
            if jasonresp.venue.starts(with: query)
            {
                filteredData.append(jasonresp)
            }
        }
        self.tableView.reloadData()
        print (filteredData)
        print("\(query)")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // title = ""
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        tableView.dataSource=self
       // field.delegate = self
     
        if  let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE3ODE0Nzd8MTYxOTI4NzQxNi45NTM2NTgz")
        {
        URLSession.shared.dataTask(with: url){data , response, error in
            if let data = data{
                let jsonDecoder=JSONDecoder()
                do{
                    var img:String = ""
                    let parsedJson=try jsonDecoder.decode(Eventresponse.self,from:data)
                    for eventData in parsedJson.events{
                        print(eventData.id)
                        print(eventData.title)
                        print(eventData.type)
                        for performer in eventData.performers
                        {
                           img = performer.image
                        }
                        let object = JasonResponse(type: eventData.type,id: eventData.id,title: eventData.title,venue: eventData.venue.display_location, image: img)
                        DispatchQueue.main.async {
                            self.responseArray.append(object)
                            self.tableView.reloadData()
                        }
            }
                
            }
                catch{print(error)}
            }
        }.resume()
                
                
     }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty{
        return filteredData.count
        }
        return responseArray.count
    }

    // used to bind the data to tableview cell
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell: EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventTableViewCell {
            
            //if we have filtered data then display it else display the complete data set
            if !filteredData.isEmpty
            {
                //assign the object value to inidividual labels
                cell.concertLabel.text = filteredData[indexPath.row].venue
                cell.titleLabel.text = filteredData[indexPath.row].title
                
                // Loading the image from the Url using kingfisher package
                // assign the object value to image link
                if let url = URL(string: filteredData[indexPath.row].image){
                
                    cell.imageLable.kf.setImage(with: url)
                
                    }
            }
            else
            {
                
                cell.concertLabel.text = responseArray[indexPath.row].venue
            cell.titleLabel.text = responseArray[indexPath.row].title
                if let url = URL(string: responseArray[indexPath.row].image){
                cell.imageLable.kf.setImage(with: url)

                }
            }
        return cell
        
    }
        return UITableViewCell()
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !filteredData.isEmpty
        {
    
        let eventData =  filteredData[indexPath.row]
       
        performSegue(withIdentifier: "Event", sender: eventData )
        }
        else {
            let eventData =  responseArray[indexPath.row]
           
            performSegue(withIdentifier: "Event", sender: eventData )
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      if  let eventVC = segue.destination as? EventViewController
        {
        eventVC.event = responseArray[(tableView.indexPathForSelectedRow?.row)! ]
      }
         
}

}













