
/*
 
** Part 1: ** We have provided information for the 18 players in the Player Info spreadsheet. Please choose an appropriate data type to store the information for each player. In addition, create an empty collection constant to hold all the players’ data. Once you have decided on what tools to use, manually enter the player data so it can be used in Part 2.
 
*/

/*
 
 ** Part 2: ** Create logic to iterate through all 18 players and assign them to teams such that the number of experienced players on each team are the same. Store each team’s players in its own collection for use in Part 3. Please note: your logic should work correctly regardless of the initial ordering of the players and the number of players. This solution should work if there are 18 players or 100.
 
 Also, if you would like to attain an “exceeds expectations” rating for this project, write code to ensure that each team's average height is within 1.5 inches of the others.
 
 */

let players : [String : [String : Any]] = [
    "Joe Smith" : ["Height": 42, "Experience": true, "Guardians": "Jim and Jan Smith"],
    "Jill Tanner" : ["Height": 36, "Experience": true, "Guardians": "Clara Tanner"],
    "Bill Bon" : ["Height": 43, "Experience": true, "Guardians": "Sara and Jenny Bon"],
    "Eva Gordon" : ["Height": 45, "Experience": false, "Guardians": "Wendy and Mike Gordon"],
    "Matt Gill" : ["Height": 40, "Experience": false, "Guardians": "Charles and Sylvia Gill"],
    "Kimmy Stein" : ["Height": 41, "Experience": false, "Guardians": "Bill and Hillary Stein"],
    "Sammy Adams" : ["Height": 45, "Experience": false, "Guardians": "Jeff Adams"],
    "Karl Saygan" : ["Height": 42, "Experience": true, "Guardians": "Heather Bledsoe"],
    "Suzane Greenberg" : ["Height": 44, "Experience": true, "Guardians": "Henrietta Dumas"],
    "Sal Dali" : ["Height": 41, "Experience": false, "Guardians": "Gala Dali"],
    "Joe Kavalier" : ["Height": 39, "Experience": false, "Guardians": "Sam and Elaine Kavalier"],
    "Ben Finkelstein" : ["Height": 44, "Experience": false, "Guardians": "Aaron and Jill Finkelstein"],
    "Diego Soto" : ["Height": 41, "Experience": true, "Guardians": "Robin and Sarika Soto"],
    "Chloe Alaska" : ["Height": 47, "Experience": false, "Guardians": "David and Jamie Alaska"],
    "Arnold Willis" : ["Height": 43, "Experience": false, "Guardians": "Claire Willis"],
    "Phillip Helm" : ["Height": 44, "Experience": true, "Guardians": "Thomas Helm and Eva Jones"],
    "Les Clay" : ["Height": 42, "Experience": true, "Guardians": "Wynonna Brown"],
    "Herschel Krustofski" : ["Height": 45, "Experience": true, "Guardians": "Hyman and Rachel Krustofski"]
]

var teamSharks : [String : [String : Any]] = [:]
var teamDragons : [String : [String : Any]] = [:]
var teamRaptors : [String : [String : Any]] = [:]

var averageHeight = 0

for player in players {
    
    // let experience = player.value["Experience"]! as! Bool
    
    if teamSharks.count != players.count / 3 {
        
        
        
        if teamSharks.count > 1 {
        }
        
    }
    
    averageHeight += player.value["Height"] as! Int
    
    
    // print(averageHeight / players.count)
    
}

print(averageHeight / players.count)

