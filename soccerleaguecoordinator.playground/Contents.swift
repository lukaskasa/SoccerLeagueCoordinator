/*
 
 Soccer League Coordinator - Project 1 - Tech Degree
 Author: Lukas Kasakaitis
 08.03.2019
 
 */

// Dictionaries for each player
let joeSmith: [String: Any] = ["name": "Joe Smith", "height": 42.0, "isExperienced": true, "guardians": "Jim and Jan Smith"]
let jillTanner: [String: Any] = ["name": "Jill Tanner", "height": 36.0, "isExperienced": true, "guardians": "Clara Tanner"]
let billBon: [String: Any] = ["name": "Bill Bon", "height": 43.0, "isExperienced": true, "guardians": "Sara and Jenny Bon"]
let evaGordon: [String: Any] = ["name": "Eva Gordon", "height": 45.0, "isExperienced": false, "guardians": "Wendy and Mike Gordon"]
let mattGill: [String: Any] = ["name": "Matt Gill", "height": 40.0, "isExperienced": false, "guardians": "Charles and Sylvia Gill"]
let kimmyStein: [String: Any] = ["name": "Kimmy Stein", "height": 41.0, "isExperienced": false, "guardians": "Bill and Hillary Stein"]
let sammyAdams: [String: Any] = ["name": "Sammy Adams", "height": 45.0, "isExperienced": false, "guardians": "Jeff Adams"]
let karlSaygan: [String: Any] =  ["name": "Karl Saygan", "height": 42.0, "isExperienced": true, "guardians": "Heather Bledsoe"]
let suzanneGreenberg: [String: Any] = ["name": "Suzane Greenberg", "height": 44.0, "isExperienced": true, "guardians": "Henrietta Dumas"]
let salDali: [String: Any] = ["name": "Sal Dali", "height": 41.0, "isExperienced": false, "guardians": "Gala Dali"]
let joeKavalier: [String: Any] = ["name": "Joe Kavalier", "height": 39.0, "isExperienced": false, "guardians": "Sam and Elaine Kavalier"]
let benFinkelstein: [String: Any] = ["name": "Ben Finkelstein", "height": 44.0, "isExperienced": false, "guardians": "Aaron and Jill Finkelstein"]
let diegoSoto: [String: Any] = ["name": "Diego Soto", "height": 41.0, "isExperienced": true, "guardians": "Robin and Sarika Soto"]
let chloeAlaska: [String: Any] = ["name": "Chloe Alaska", "height": 47.0, "isExperienced": false, "guardians": "David and Jamie Alaska"]
let arnoldWillis: [String: Any] = ["name": "Arnold Willis", "height": 43.0, "isExperienced": false, "guardians": "Claire Willis"]
let phillipHelm: [String: Any] = ["name": "Phillip Helm", "height": 44.0, "isExperienced": true, "guardians": "Thomas Helm and Eva Jones"]
let lesClay: [String: Any] = ["name": "Les Clay", "height": 42.0, "isExperienced": true, "guardians": "Wynonna Brown"]
let herschelKrustofski: [String: Any] = ["name": "Herschel Krustofski", "height": 45.0, "isExperienced": true, "guardians": "Hyman and Rachel Krustofski"]

// Array to hold all players
let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzanneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

// Function to calculate average height
func averageHeightOf(_ team: [[String : Any]]) -> Double {
    var averageHeight : Double = 0.0
    
    for player in team {
        if let height = player["height"] as? Double {
            averageHeight += height
        }
    }
    
    switch team.count {
    case 0: return 0
    default: return averageHeight / Double(team.count)
    }
}


// Function to calculate number of experienced players
func numberOfExperienced(_ players: [[String: Any]]) -> Int {
    var numberOfExperiencedPlayers = 0
    
    for player in players {
        guard let isExperienced = player["isExperienced"] as? Bool else { break }
        if isExperienced {
            numberOfExperiencedPlayers += 1
        }
    }
    
    return numberOfExperiencedPlayers
}

// Function to get experienced players
func getExperienced(_ players: [[String : Any]]) -> [[String : Any]] {
    var experiencedPlayers = [[String : Any]]()
    
    for player in players {
        guard let isExperienced = player["isExperienced"] as? Bool else { break }
        
        if isExperienced {
            experiencedPlayers.append(player)
        }
    }
    return experiencedPlayers
}

// Function to get experienced players
func getInExperienced(_ players: [[String : Any]]) -> [[String : Any]] {
    var inExperiencedPlayers = [[String : Any]]()
    
    for player in players {
        guard let isExperienced = player["isExperienced"] as? Bool else { break }
        
        if !isExperienced {
            inExperiencedPlayers.append(player)
        }
    }
    return inExperiencedPlayers
}

// Function to get tallest Player
func getTallest(from players: [[String : Any]]) -> [String: Any] {
    var tallestPlayer = [String: Any]()
    var tallestPlayerHeight = Double()
    
    for player in players {
        // Retrieve the tallest player first
        guard let playerHeight = player["height"] as? Double else { fatalError("Player Height is not a Double!") }
        // if array is emty add it to the array
        if tallestPlayer.count < 1 {
            tallestPlayer = player
            if let height = tallestPlayer["height"] as? Double {
                tallestPlayerHeight = height
            }
            // if current player in loop is taller replace the tallestPlayer
        } else if playerHeight > tallestPlayerHeight {
            tallestPlayer.removeAll()
            tallestPlayer = player
            if let height = tallestPlayer["height"] as? Double {
                tallestPlayerHeight = height
            }
        }
    }
    
    return tallestPlayer
}

// Function to devide players into teams by number of team names
func divideInto(teamNames: [String], with players: [[String : Any]]) -> [String : [[String: Any]]] {
    let playersPerTeam = players.count / teamNames.count
    var inExperiencedPlayers = getInExperienced(players)
    var experiencedPlayers = getExperienced(players)
    let experiencedPlayersPerTeam = experiencedPlayers.count / teamNames.count
    var teams = [String: [[String: Any]] ]()
    
    // Create the number of dictionaries as there are teams
    for i in 0..<teamNames.count {
        teams[teamNames[i]] = []
    }
    
    var index : Int = 0
    
    // Put experienced players into teams
    while experiencedPlayers.count > 0 {
        let tallestPlayer = getTallest(from: experiencedPlayers)
        guard let name = tallestPlayer["name"] as? String else { fatalError("name: String not found!") }
        guard let team = teams[teamNames[index]] else { fatalError("Team was not Found") }
        
        if numberOfExperienced(team) != experiencedPlayersPerTeam {
            teams[teamNames[index]]?.append(tallestPlayer)
            experiencedPlayers.removeAll { element in
                guard let playerToBeRemoved = element["name"] as? String else { fatalError("name: String not found!") }
                return playerToBeRemoved == name
            }
        }
        if index == teamNames.count - 1 {
            index = 0
        } else {
            index += 1
        }
    }
    
    // Swap index to distrbute players more evenly
    index = teamNames.count - 1
    
    // Put in experienced players into teams
    while inExperiencedPlayers.count > 0 {
        let tallestPlayer = getTallest(from: inExperiencedPlayers)
        guard let name = tallestPlayer["name"] as? String else { fatalError("name: String not found!") }
        guard let team = teams[teamNames[index]] else { fatalError("Team was not Found") }
        
        if team.count != playersPerTeam {
            teams[teamNames[index]]?.append(tallestPlayer)
            inExperiencedPlayers.removeAll { element in
                guard let playerToBeRemoved = element["name"] as? String else { fatalError("name: String not found!") }
                return playerToBeRemoved == name
            }
        }
        if index == 0 {
            index = teamNames.count - 1
        } else {
            index -= 1
        }
    }
    
    return teams
}

// Function to create letters which returns an Array of Strings
func writeLetterTo(_ teams: [String : [[String : Any]]]) -> [String] {
    var letters = [String]()
    var letter = String()
    var practiceTime = String()
    
    for team in teams {
        let teamName = team.key
        
        if teamName == "Dragons" {
            practiceTime = "March 17, 1pm"
        } else if teamName == "Sharks" {
            practiceTime = "March 17, 3pm"
        } else {
            practiceTime = "March 18, 1pm"
        }
        
        for player in team.value {
            guard let guardians = player["guardians"] as? String else { fatalError("guardians: String not found!") }
            guard let playerName = player["name"] as? String else { fatalError("name: String not found!") }
            
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

var teams = divideInto(teamNames: ["Sharks", "Dragons", "Raptors"], with: players)
guard let teamSharks = teams["Sharks"] else { fatalError("Team Sharks doesn't exist!") }
guard let teamDragons = teams["Dragons"] else { fatalError("Team Dargons doesn't exist!") }
guard let teamRaptors = teams["Raptors"] else { fatalError("Team Raptors doesn't exist!") }


// Print Team Sharks
print("Sharks: \(teamSharks)")
print("\n")
print("Team Sharks height average: \(averageHeightOf(teamSharks))")
print("\n")

// Print Team Dragons
print("Dragons: \(teamDragons)")
print("\n")
print("Team Dragons height average: \(averageHeightOf(teamDragons))")
print("\n")

// Print Team Raptors
print("Raptors: \(teamRaptors)")
print("\n")
print("Team Raptors height average: \(averageHeightOf(teamRaptors))")
print("\n")


let letters = writeLetterTo(teams)
//Print All teams and Height Averages
print("---Letters---")
printLetters(letters: letters)
