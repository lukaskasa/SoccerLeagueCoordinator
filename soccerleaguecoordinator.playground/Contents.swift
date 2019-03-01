
/*
 
 Author: Lukas Kasakaitis
 
*/

// Dictionary to store Soccer League Players

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

let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzanneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

// Function to Calculate Number of Experienced Players
func numberOfExperienced(_ players: [[String: Any]]) -> Int {
    var numberOfExperiencedPlayers = 0
    
    for player in players {
        if isExperienced(player) {
            numberOfExperiencedPlayers += 1
        }
    }
    
    return numberOfExperiencedPlayers
}

// Function to Find out if player is experienced

func isExperienced(_ player: [String : Any]) -> Bool {
    let withExperience = player["isExperienced"]! as! Bool
    
    if withExperience {
        return true
    } else {
        return false
    }
}

// Function to Calculate AverageHeight

func averageHeightOf(_ team: [[String : Any]]) -> Double {
    var averageHeight : Double = 0.0
    for player in team {
        averageHeight += player["height"] as! Double
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
        sum += player.value["height"] as! Double
    }
    
    return sum
}

// Function to seperate Experienced from inexperienced

func filterPlayers(experienced: Bool, _ players: [[String : Any]]) -> [[String : Any]] {
    var players = players
    var sortedPlayers = [[String : Any]]()
    
    for player in players {
        if experienced && isExperienced(player) {
            sortedPlayers.append(player)
             players.removeAll(where: {$0["name"] as! String == player["name"] as! String})
        } else if !experienced && !isExperienced(player){
            sortedPlayers.append(player)
            players.removeAll(where: {$0["name"] as! String == player["name"] as! String})
        } else {
             players.removeAll(where: {$0["name"] as! String == player["name"] as! String})
        }
    }
    
    return sortedPlayers
}

// Function to devide players into teams

func divideInto(teamNames: [String], with players: [[String : Any]]) -> [String : [[String: Any]]] {
    let playersPerTeam = players.count / teamNames.count
    let experiencedPlayersPerTeam = numberOfExperienced(players) / teamNames.count
    
    var playerSets = [[String : Any]]()
    playerSets.append(contentsOf: filterPlayers(experienced: true, players))
    playerSets.append(contentsOf: filterPlayers(experienced: false, players))
    var teams = [String: [[String: Any]] ]()
    var tallestPlayer = [[String: Any]]()
    var tallestPlayerHeight = Double()
    
    // Create the number of dictionaries as there are teams
    for i in 0..<teamNames.count {
        teams[teamNames[i]] = []
    }
    
    var index : Int = 0
    
    // Continue to loop until dictionaries are empty
    while playerSets.count > 0 {
        
            for player in playerSets {
                // Retrieve the tallest player first
                let playerHeight =  player["height"] as! Double
                
                if tallestPlayer.count < 1 {
                    tallestPlayer.append(player)
                    tallestPlayerHeight = tallestPlayer[0]["height"] as! Double
                } else if playerHeight > tallestPlayerHeight {
                    tallestPlayer.removeAll()
                    tallestPlayer.append(player)
                    tallestPlayerHeight = tallestPlayer[0]["height"] as! Double
                }
            }
        
            guard let name = tallestPlayer[0]["name"] else { fatalError("Name doesn't Exist") }
            
            // Tallest players get into the team first
            if isExperienced(tallestPlayer[0]) && numberOfExperienced(teams[teamNames[index]]!) != experiencedPlayersPerTeam {
                
                teams[teamNames[index]]!.append(tallestPlayer[0])
                playerSets.removeAll(where: {$0["name"] as! String == name as! String})
                tallestPlayer.removeAll()
                
            } else if teams[teamNames[index]]!.count != playersPerTeam {
                
                teams[teamNames[index]]!.append(tallestPlayer[0])
                playerSets.removeAll(where: {$0["name"] as! String == name as! String})
                tallestPlayer.removeAll()
                
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
func writeLetterTo(_ teams: [String : [[String : Any]]]) -> [String] {
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
            let guardians = player["guardians"]!
            let playerName = player["name"]!

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
 divideInto(teamNames: ["Sharks", "Dragons", "Raptors"], with: players)
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


/**
 @lukaskasa A couple of things:
 - Your player dictionaries should look a bit different:
 `let joeSmith: [String: Any] = ["name": "Joe Smith", "height": 42.0, "isExperienced": true, "guardians": "Jim and Jan Smith"]` for example. Notice that the key names are lowercased to conform to Apple’s API Design Guidelines. Also, getting the name of the player is now easier since it has its own key.
 - `let experience = player.value["Experience"]! as! Bool` force unwrapping optionals isn’t the best idea. Although not covered in unit 1 here’s a link with an introduction to optionals in Swift.
 
   https://parussini.codes/2019/02/13/the-techdegree-blog-optionals-in-swift-and-how-to-deal-with-them/
 **/


