
/*
 
 Soccer League Coordinator - Project 1 - Tech Degree
 Author: Lukas Kasakaitis
 05.03.2019
 
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
let phillipHelm: [String: Any] = ["name": "Phillip Helm", "height": 43.0, "isExperienced": true, "guardians": "Claire Willis"]
let lesClay: [String: Any] = ["name": "Les Clay", "height": 42.0, "isExperienced": true, "guardians": "Wynonna Brown"]
let herschelKrustofski: [String: Any] = ["name": "Herschel Krustofski", "height": 45.0, "isExperienced": true, "guardians": "Hyman and Rachel Krustofski"]
let lukas: [String: Any] = ["name": "Leerfs Clay2", "height": 45.2, "isExperienced": true, "guardians": "rree Brown"]
let lukas2: [String: Any] = ["name": "Herscefhel fereee", "height": 41.4, "isExperienced": true, "guardians": "Hyman and rrRachel Krustofski"]
let lukas3: [String: Any] = ["name": "Herschwel Krustofski2", "height": 43.0, "isExperienced": true, "guardians": "Hyman andeeRachel Krustofski"]
let lukas4: [String: Any] = ["name": "Leerfs Clay2", "height": 46.0, "isExperienced": true, "guardians": "rree Brown"]
let lukas5: [String: Any] = ["name": "Herscewfhel fereee", "height": 41.7, "isExperienced": true, "guardians": "Hyman and rrRachel Krustofski"]
let lukas6: [String: Any] = ["name": "Herschel Krustofswki2", "height": 43.4, "isExperienced": true, "guardians": "Hyman andeeRachel Krustofski"]

// Array to hold all players
let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzanneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski, lukas, lukas2, lukas3, lukas4, lukas5, lukas6]

// Function to calculate number of experienced players

func numberOfExperienced(_ players: [[String: Any]]) -> Int {
    var numberOfExperiencedPlayers = 0
    
    for player in players {
        if isExperienced(player) {
            numberOfExperiencedPlayers += 1
        }
    }
    
    return numberOfExperiencedPlayers
}

// Function to find out if player is experienced

func isExperienced(_ player: [String : Any]) -> Bool {
    guard let withExperience = player["isExperienced"] as? Bool else { return false }
    
    if withExperience {
        return true
    } else {
        return false
    }
}

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

// Function to seperate Experienced from inexperienced

func filterPlayers(experienced: Bool, _ players: [[String : Any]]) -> [[String : Any]] {
    var players = players
    var sortedPlayers = [[String : Any]]()
    
    for player in players {
        
        guard let name = player["name"] as? String else { fatalError("name: String not found!") }
        
        if experienced && isExperienced(player) {
            sortedPlayers.append(player)
            players.removeAll {element in
                guard let playerToBeRemoved = element["name"] as? String else { fatalError("name: String not found!") }
                return playerToBeRemoved == name
            }
        } else if !experienced && !isExperienced(player){
            sortedPlayers.append(player)
            players.removeAll {element in
                guard let playerToBeRemoved = element["name"] as? String else { fatalError("name: String not found!") }
                return playerToBeRemoved == name
            }
        }
    }
    
    return sortedPlayers
}

// Function to devide players into teams by number of team names

func divideInto(teamNames: [String], with players: [[String : Any]]) -> [String : [[String: Any]]] {
    let playersPerTeam = players.count / teamNames.count
    let experiencedPlayersPerTeam = numberOfExperienced(players) / teamNames.count
    
    var playerSets = [filterPlayers(experienced: true, players), filterPlayers(experienced: false, players)]
    var teams = [String: [[String: Any]] ]()
    var tallestPlayer = [[String: Any]]()
    var tallestPlayerHeight = Double()
    
    // Create the number of dictionaries as there are teams
    for i in 0..<teamNames.count {
        teams[teamNames[i]] = []
    }
    
    var index : Int = 0
    
    // Continue to loop until all players have been assigned to a team
    while playerSets[0].count > 0 && playerSets[1].count > 0 {
    
        for set in playerSets {
            
            for player in set {
                // Retrieve the tallest player first
                guard let playerHeight = player["height"] as? Double else { fatalError("Player Height is not a Double!") }
                // if array is emty add it to the array
                if tallestPlayer.count < 1 {
                    tallestPlayer.append(player)
                    if let height = tallestPlayer[0]["height"] as? Double {
                        tallestPlayerHeight = height
                    }
                    // if current player in loop is taller replace the tallestPlayer
                } else if playerHeight > tallestPlayerHeight {
                    tallestPlayer.removeAll()
                    tallestPlayer.append(player)
                    if let height = tallestPlayer[0]["height"] as? Double {
                        tallestPlayerHeight = height
                    }
                }
            }
            
            guard let name = tallestPlayer[0]["name"] as? String else { fatalError("name: String not found!") }
            guard let team = teams[teamNames[index]] else { fatalError("Team was not Found") }
            
            // Tallest players get into the team first
            if isExperienced(tallestPlayer[0]) && numberOfExperienced(team) != experiencedPlayersPerTeam {
                if teams[teamNames[index]] != nil {
                    teams[teamNames[index]]?.append(tallestPlayer[0])
                }
                // Remove player from collection once it has been assigned
                playerSets[0].removeAll {element in
                    guard let playerToBeRemoved = element["name"] as? String else { fatalError("name: String not found!") }
                    return playerToBeRemoved == name
                }
                tallestPlayer.removeAll()
            } else if !isExperienced(tallestPlayer[0]) && teams[teamNames[index]]!.count != playersPerTeam {
                if teams[teamNames[index]] != nil {
                    teams[teamNames[index]]?.append(tallestPlayer[0])
                }
                // Remove player from collection once it has been assigned
                playerSets[1].removeAll { element in
                    guard let playerToBeRemoved = element["name"] as? String else { fatalError("name: String not found!") }
                    return playerToBeRemoved == name
                }
                
                tallestPlayer.removeAll()
            }
            
            // Increase Index in order to distrubute players evenly between the teams to achieve an even height distribution
            if index == teamNames.count - 1 {
                index = 0
            } else {
                index += 1
            }
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

if let team = teams["Sharks"] {
    print("Sharks: \(team)")
    print("\n")
    print("Sharks height average: \(averageHeightOf(team))")
    print("\n")
}

if let team = teams["Dragons"] {
    print("Dragons: \(team)")
    print("\n")
    print("Dragons height average: \(averageHeightOf(team))")
    print("\n")
}

if let team = teams["Raptors"] {
    print("Raptors: \(team)")
    print("\n")
    print("Raptors height average: \(averageHeightOf(team))")
    print("\n")
}

let letters = writeLetterTo(teams)
//Print All teams and Height Averages
printLetters(letters: letters)

