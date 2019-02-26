
/*
 
 Author: Lukas Kasakaitis
 
*/

// Dictionary to store Soccer League Players
let players : [String : [String : Any]] = [
    "Joe Smith" : ["Height": 42.0, "Experience": true, "Guardians": "Jim and Jan Smith"],
    "Jill Tanner" : ["Height": 36.0, "Experience": true, "Guardians": "Clara Tanner"],
    "Bill Bon" : ["Height": 43.0, "Experience": true, "Guardians": "Sara and Jenny Bon"],
    "Eva Gordon" : ["Height": 45.0, "Experience": false, "Guardians": "Wendy and Mike Gordon"],
    "Matt Gill" : ["Height": 40.0, "Experience": false, "Guardians": "Charles and Sylvia Gill"],
    "Kimmy Stein" : ["Height": 41.0, "Experience": false, "Guardians": "Bill and Hillary Stein"],
    "Sammy Adams" : ["Height": 45.0, "Experience": false, "Guardians": "Jeff Adams"],
    "Karl Saygan" : ["Height": 42.0, "Experience": true, "Guardians": "Heather Bledsoe"],
    "Suzane Greenberg" : ["Height": 44.0, "Experience": true, "Guardians": "Henrietta Dumas"],
    "Sal Dali" : ["Height": 41.0, "Experience": false, "Guardians": "Gala Dali"],
    "Joe Kavalier" : ["Height": 39.0, "Experience": false, "Guardians": "Sam and Elaine Kavalier"],
    "Ben Finkelstein" : ["Height": 44.0, "Experience": false, "Guardians": "Aaron and Jill Finkelstein"],
    "Diego Soto" : ["Height": 41.0, "Experience": true, "Guardians": "Robin and Sarika Soto"],
    "Chloe Alaska" : ["Height": 47.0, "Experience": false, "Guardians": "David and Jamie Alaska"],
    "Arnold Willis" : ["Height": 43.0, "Experience": false, "Guardians": "Claire Willis"],
    "Phillip Helm" : ["Height": 44.0, "Experience": true, "Guardians": "Thomas Helm and Eva Jones"],
    "Les Clay" : ["Height": 42.0, "Experience": true, "Guardians": "Wynonna Brown"],
    "Herschel Krustofski" : ["Height": 45.0, "Experience": true, "Guardians": "Hyman and Rachel Krustofski"]
]

// Function to Calculate Number of Experienced Players
func numberOfExperienced(_ players: [String: [String: Any]]) -> Int {
    var numberOfExperiencedPlayers = 0
    
    for player in players {
        
        let experience = player.value["Experience"]! as! Bool
        
        if experience {
            numberOfExperiencedPlayers += 1
        }
    }
    
    return numberOfExperiencedPlayers
}

// Function to Find out if player is experienced

func isExperienced(_ player: [String : Any]) -> Bool {
    let withExperience = player["Experience"]! as! Bool
    
    if withExperience {
        return true
    } else {
        return false
    }
}

// Function to Calculate AverageHeight

func averageHeightOf(_ team: [String : [String : Any]]) -> Double {
    var averageHeight : Double = 0.0
    
    for player in team {
        averageHeight += player.value["Height"] as! Double
    }
    
    switch team.count {
    case 0: return 0
    default: return averageHeight / Double(team.count)
    }
}

// Function to Calculate AverageHeight

func sumOfHeights(_ team: [String : [String : Any]]) -> Double {
    var sum : Double = 0.0
    
    for player in team {
        sum += player.value["Height"] as! Double
    }
    
    return sum
}

// Function to seperate Experienced from inexperienced

func filterPlayers(experienced: Bool, _ players: [String : [String : Any]]) -> [String : [String : Any]] {
    var players = players
    var sortedPlayers = [String : [String : Any]]()
    
    for player in players {
        if experienced && isExperienced(player.value) {
            sortedPlayers.updateValue(player.value, forKey: player.key)
            players.removeValue(forKey:  player.key)
        } else if !experienced && !isExperienced(player.value){
            sortedPlayers.updateValue(player.value, forKey: player.key)
            players.removeValue(forKey: player.key)
        } else {
            players.removeValue(forKey: player.key)
        }
    }
    
    return sortedPlayers
}

// Function to devide players into teams

func divideInto(teamNames: [String], with players: [String : [String : Any]]) -> [String : [String: [String: Any]]] {
    let playersPerTeam = players.count / teamNames.count
    let experiencedPlayersPerTeam = numberOfExperienced(players) / teamNames.count
    
    var playerSets = [filterPlayers(experienced: true, players), filterPlayers(experienced: false, players)]
    var teams = [String : [String: [String: Any]]]()
    var tallestPlayer = [String: [String: Any]]()
    var tallestPlayerHeight = Double()
    
    // Create the number of dictionaries as there are teams
    for i in 0..<teamNames.count {
        teams[teamNames[i]] = [:]
    }
    
    var index : Int = 0
    
    // Continue to loop until dictionaries are empty
    while playerSets[0].count > 0 && playerSets[1].count > 0 {
        
        for set in playerSets {
            for player in set {
                // Retrieve the tallest player first
                let playerHeight =  player.value["Height"] as! Double
                
                if tallestPlayer.count < 1 {
                    tallestPlayer[player.key] = player.value
                    tallestPlayerHeight = tallestPlayer.first?.value["Height"] as! Double
                } else if playerHeight > tallestPlayerHeight {
                    tallestPlayer.removeAll()
                    tallestPlayer[player.key] = player.value
                    tallestPlayerHeight = tallestPlayer.first?.value["Height"] as! Double
                }
            }
            
            // Tallest players get into the team first
            if isExperienced(tallestPlayer.first!.value) && numberOfExperienced(teams[teamNames[index]]!) != experiencedPlayersPerTeam {
                teams[teamNames[index]]!.updateValue(tallestPlayer.first!.value, forKey: tallestPlayer.first!.key)
                playerSets[0].removeValue(forKey: tallestPlayer.first!.key)
                tallestPlayer.removeAll()
            } else if teams[teamNames[index]]!.count != playersPerTeam {
                teams[teamNames[index]]!.updateValue(tallestPlayer.first!.value, forKey: tallestPlayer.first!.key)
                playerSets[1].removeValue(forKey: tallestPlayer.first!.key)
                tallestPlayer.removeAll()
            }
        }
       
        // Increase Index in order to distrubute players evenly
        if index == teamNames.count - 1 {
            index = 0
        } else {
            index += 1
        }

    }

    return teams
}


// Function to create letters which returns an Array of Strings
func writeLetterTo(_ teams: [String : [String : [String : Any]]]) -> [String] {
    var letters = [String]()
    var letter : String = ""
    var practiceTime : String = ""
    
    for team in teams {
        let teamName = team.key
        
        if teamName == "Dragons" {
            practiceTime = "March 17, 1pm"
        } else if teamName == "Sharks" {
            practiceTime = "March 17, 3pm"
        }else {
            practiceTime = "March 18, 1pm"
        }
        
        for player in team.value {
            let guardians = player.value["Guardians"]!
            let playerName = player.key
            
            letter = "Dear \(guardians), \n your child \(playerName) has been selected by team \(teamName). Practice starts on \(practiceTime). We are excited to meet \(playerName) \n Best Regards \n Team \(teamName)"
            
            letters.append(letter)
        }
    }

    
    return letters
}


// Function to print all letters to the Console
func printLetters(letters: [String]) -> Void {
    for letter in letters {
        print("\n")
        print(letter)
    }
}


//Print All teeam

var teams = divideInto(teamNames: ["Sharks", "Dragons", "Raptors"], with: players)

var teamSharks = teams["Sharks"]
var teamDragons = teams["Dragons"]
var teamRaptors = teams["Raptors"]

if let team = teamSharks {
    print("Sharks: \(team)")
    print("\n")
    print("Sharks height average: \(averageHeightOf(team))")
    print("\n")
}

if let team = teamDragons {
    print("Dragons: \(team)")
    print("\n")
    print("Dragons height average: \(averageHeightOf(team))")
    print("\n")
}

if let team = teamRaptors {
    print("Raptors: \(team)")
    print("\n")
    print("Raptors height average: \(averageHeightOf(team))")
    print("\n")
}

let letters = writeLetterTo(teams)

printLetters(letters: letters)





