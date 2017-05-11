/// Databázové připojení
let realm = try! Realm()
let producer = SignalProducer<Realm, RealmError>(value: realm)

/// Kolekce prvků z databáze
producer.fetch(collectionOf: File.self)
    .startWithValues { files in
        /* ... */
    }

/// Jeden konkrétní prvek podle primárního klíče
producer.fetch(File.self, forPrimaryKey: "file.gcode")
    .startWithValues { file in
        /* ... */
    }
