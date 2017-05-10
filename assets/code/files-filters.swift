struct Filters {
    typealias Filter = NSPredicate

    // Zobrazí veškeré soubory
    static let all = NSPredicate(value: true)

    // Zobrazí pouze soubory v tiskárně
    static let local = NSPredicate(format: "_origin = %@",
                                           Origin.local)

    // Zobrazí pouze soubory na peměťové kartě
    static let sdcard = NSPredicate(format: "_origin = %@",
                                    Origin.sdcard)
}
