
/*
 
** Part 1: ** We have provided information for the 18 players in the Player Info spreadsheet. Please choose an appropriate data type to store the information for each player. In addition, create an empty collection constant to hold all the players’ data. Once you have decided on what tools to use, manually enter the player data so it can be used in Part 2.
 
*/

/*
 
 ** Part 2: ** Create logic to iterate through all 18 players and assign them to teams such that the number of experienced players on each team are the same. Store each team’s players in its own collection for use in Part 3. Please note: your logic should work correctly regardless of the initial ordering of the players and the number of players. This solution should work if there are 18 players or 100.
 
 Also, if you would like to attain an “exceeds expectations” rating for this project, write code to ensure that each team's average height is within 1.5 inches of the others.
 
 */

// Soccer League Players

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
//
//"Lukas Kasakaitis" : ["Height": 43.0, "Experience": true, "Guardians": "Edmundas and Janina Kasakaitis"],
//"David Kasakaitis" : ["Height": 46.0, "Experience": true, "Guardians": "Edmundas and Janina Kasakaitis"],
//"Artur Stankewizius" : ["Height": 42.0, "Experience": true, "Guardians": "Algimantas and Regina Stankewizius"],
//"Lukas Kasakaitis2" : ["Height": 43.0, "Experience": true, "Guardians": "Edmundas and Janina Kasakaitis"],
//"David Kasakaitis2" : ["Height": 46.0, "Experience": true, "Guardians": "Edmundas and Janina Kasakaitis"],
//"Artur Stankewizius2" : ["Height": 42.0, "Experience": true, "Guardians": "Algimantas and Regina Stankewizius"],
//"Lukas Kasakaitis3" : ["Height": 43.0, "Experience": true, "Guardians": "Edmundas and Janina Kasakaitis"],
//"David Kasakaitis3" : ["Height": 46.0, "Experience": true, "Guardians": "Edmundas and Janina Kasakaitis"],
//"Artur Stankewizius3" : ["Height": 42.0, "Experience": true, "Guardians": "Algimantas and Regina Stankewizius"]

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
    var nextPlayer = [String: [String: Any]]()
    var tallestPlayerHeight = Double()
    
    for i in 0..<teamNames.count {
        teams[teamNames[i]] = [:]
    }
    
    var index : Int = 0
    
    while playerSets[0].count > 0 && playerSets[1].count > 0 {
        
        for set in playerSets {
            for player in set {
                
                let playerHeight =  player.value["Height"] as! Double
                
                if nextPlayer.count < 1 {
                    nextPlayer[player.key] = player.value
                    tallestPlayerHeight = nextPlayer.first?.value["Height"] as! Double
                } else if playerHeight > tallestPlayerHeight {
                    nextPlayer.removeAll()
                    nextPlayer[player.key] = player.value
                    tallestPlayerHeight = nextPlayer.first?.value["Height"] as! Double
                }
            }
            
            if isExperienced(nextPlayer.first!.value) && numberOfExperienced(teams[teamNames[index]]!) != experiencedPlayersPerTeam {
                teams[teamNames[index]]!.updateValue(nextPlayer.first!.value, forKey: nextPlayer.first!.key)
                playerSets[0].removeValue(forKey: nextPlayer.first!.key)
                nextPlayer.removeAll()
            } else if teams[teamNames[index]]!.count != playersPerTeam {
                teams[teamNames[index]]!.updateValue(nextPlayer.first!.value, forKey: nextPlayer.first!.key)
                playerSets[1].removeValue(forKey: nextPlayer.first!.key)
                nextPlayer.removeAll()
            }
        }
       
        if index == teamNames.count - 1 {
            index = 0
        } else {
            index += 1
        }

    }

    return teams
}

var teams = divideInto(teamNames: ["teamSharks", "teamDragons", "teamRaptors"], with: players)

var teamSharks = teams["teamSharks"]
var teamDragons = teams["teamDragons"]
var teamRaptors = teams["teamRaptors"]


if let team = teamSharks {
    print(team)
    let teamSharksHeightAverage = averageHeightOf(team)
    print(teamSharksHeightAverage)
}

if let team = teamDragons {
    print(team)
    let teamDragonsHeightAverage = averageHeightOf(team)
    print(teamDragonsHeightAverage)
}

if let team = teamRaptors {
    print(team)
    let teamRaptorsHeightAverage = averageHeightOf(team)
    print(teamRaptorsHeightAverage)
}
