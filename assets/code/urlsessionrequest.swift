let endpoint = URL(string: "http://10.0.2.27:3200/api/version")

printer.dataTask(with: url) { (data, response, error) in
    /* zpracování odpovědi */
}.resume()
