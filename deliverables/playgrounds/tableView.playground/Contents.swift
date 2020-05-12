//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation
import CoreLocation


//PlaygroundPage.current.needsIndefiniteExecution = true

class Session: NSObject {
    
    //properties
    var seshID: Int?
    var ownerID: Int?
    var title: String?
    var courseCode: String?
    var sessionDescription: String?
    var date: String?
    var time: String?
    var address: String?
    var isPrivate: String?
    
    
    //empty constructor
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(seshID: Int, ownerID: Int, address: String, title: String, courseCode: String, sessionDescription: String, date: String, time: String, isPrivate:String) {
        
        self.seshID = seshID
        self.ownerID = ownerID
        self.address = address
        self.title = title
        self.courseCode = courseCode
        self.sessionDescription = sessionDescription
        self.date = date
        self.time = time
        self.address = address
        self.isPrivate = isPrivate
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(String(describing: seshID)), Address: \(String(describing: address)), Title: \(String(describing: title)), Course Code: \(String(describing: courseCode)), Session Description: \(String(describing: sessionDescription)), Date: \(String(describing: date)), Time: \(String(describing: time)), Address: \(String(describing: address)), isPrivate: \(String(describing: isPrivate))"
    }
    
    
}


protocol SessionModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class SessionModel: NSObject, URLSessionDataDelegate {

    //properties

    weak var delegate: SessionModelProtocol!

    var data = Data()

    let urlPath: String = "https://cgi.sice.indiana.edu/~team50/database/GetCreatedSessions.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            } else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let sessions = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let session = Session()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let seshID = jsonElement["seshID"] as? Int,
                let ownerID = jsonElement["ownerID"] as? Int,
                let title = jsonElement["title"] as? String,
                let courseCode = jsonElement["courseCode"] as? String,
                let sessionDescription = jsonElement["sessionDescription"] as? String,
                let date = jsonElement["date"] as? String,
                let time = jsonElement["time"] as? String,
                let address = jsonElement["address"] as? String,
                let isPrivate = jsonElement["isPrivate"] as? String
                //let latitude = jsonElement["Latitude"] as? String,
                //let longitude = jsonElement["Longitude"] as? String
            {
                
                 session.seshID = seshID
                 session.ownerID = ownerID
                 session.title = title
                 session.courseCode = courseCode
                 session.sessionDescription = sessionDescription
                 session.date = date
                 session.time = time
                 session.address = address
                 session.isPrivate = isPrivate
                
            }
            
            sessions.add(session)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: sessions)
            
        })
    }
}

// VIEW
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SessionModelProtocol  {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : Session = Session()
    @IBOutlet weak var listTableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let sessionModel = SessionModel()
        sessionModel.delegate = self
        sessionModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: Session = feedItems[indexPath.row] as! Session
        // Get references to labels of cell
        myCell.textLabel!.text = item.address
        
        return myCell
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = ViewController()
