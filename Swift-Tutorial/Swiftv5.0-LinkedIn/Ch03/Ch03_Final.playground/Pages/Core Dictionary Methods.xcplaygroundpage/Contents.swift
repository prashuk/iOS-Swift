/*:
 # Core Dictionary Methods
 ---
 
 ## Topic Essentials
Dictionary elements can be easily updated and removed using subscript syntax or class methods.
 
 ### Objectives
 + Create a dictionary called **playerStats** and initialize it with key-value pairs
 + Update **playerStats** using different methods
 + Remove key-value pairs from **playerStats** using different methods
 + Create a 2 dimensional dictionary called **questBoard** and populate it
 + Use chained subcripts to access a nested key-value pair
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Caching and overwriting items
var playerStats: [String: Int] = ["HP": 100, "Attack": 35, "Gold": 29]
var oldValue = playerStats.updateValue(30, forKey: "Attack")
playerStats
playerStats = ["Evasion": 12, "MP": 55]

// Caching and removing items
playerStats["Gold"] = nil
playerStats.removeValue(forKey: "Gold")
playerStats

// Sorted Map
let sortedPlayerStats = playerStats.keys.sorted()
let sortPlayer = playerStats.sorted{ $0.0 > $1.0 }
sortPlayer

// Nested dictionaries
var questBoard = [
    "Fetch Gemstones": [
        "Objective": "Retrieve 5 gemstones",
        "Secret": "Complete in under 5 mintues"
    ],
    "Defeat Big Boss": [
        "Objective": "Beat the boss",
        "Secret": "Win with 50% health"
    ]
]

var gemstoneObjective = questBoard["Fetch Gemstones"]?["Objective"]


let responseMessage: [Int: String] = [200: "OK",
                                      403: "Access forbidden",
                                      404: "File not found",
                                      500: "Internal server error"]
let httpCode: [Int] = [200, 403, 301]

for code in httpCode {
    if let msg = responseMessage[code] {
        print(msg)
    } else {
        print("Unknown")
    }
}
for (key, value) in responseMessage {
    if httpCode.contains(key) {
        print(key, value)
    } else {
        print("\(key) Not found")
    }
}


