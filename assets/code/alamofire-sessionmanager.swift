import Alamofire

let fileURL = ...
let configuration = ...
let manager = SessionManager(configuration: configuration)

manager.request(Router.printFile(fileURL))
    .validate().response { response in
        /* zpracování odpovědi*/
    }
