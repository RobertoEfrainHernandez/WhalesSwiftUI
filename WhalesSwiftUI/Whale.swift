//
//  Whale.swift
//  WhalesSwiftUI
//
//  Created by Roberto Hernandez on 2/28/21.
//

import Foundation

struct Whale: Identifiable {
  let id: UUID = UUID()
  let name: String
  let image: URL
}

//MARK:- Static Data Chosen from 

extension Whale {
  static var whales: [Whale] {
    [
      Whale(name: "Bowhead Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-bowhead-whale.png?null&itok=lVsJuc9v")!),
      Whale(name: "Gray Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-gray-whale.png?null&itok=r5uMVbmg")!),
      Whale(name: "North Atlantic Right Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-north-atlantic-right-whale.png?null&itok=-GBUyvbc")!),
      Whale(name: "North Pacific Right Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-north-pacific-right-whale.png?null&itok=3TCE0WP6")!),
      Whale(name: "Sei Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-sei-whale.png?null&itok=aV7zzhmQ")!),
      Whale(name: "Killer Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-killer-whale.png?null&itok=mpHhEa6Y")!),
      Whale(name: "False Killer Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-false-killer-whale.png?null&itok=v9Lw8QPd")!),
      Whale(name: "Beluga Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-beluga-whale.png?null&itok=KcnZO3rE")!),
      Whale(name: "Bryde's", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/64-x427-brydes-whale.png?null&itok=dJsH4hLg")!),
      Whale(name: "Humpback Whale", image: URL(string: "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-humpback.png?null&itok=xJdovo_r")!)
    ]
  }
  
  static var randomWhale: Whale {
    Whale.whales.randomElement()!
  }
}
