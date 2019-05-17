import UIKit

struct Pokemon: Decodable{
    let name: String
    let weight: Int
    let baseExperience: Int
    let height: Int
    let abilities: [Ability]//array of dictionary requires new struct
    let forms: [NUStruct]
    let gameindices: [gIndices]
    let id: Int
    let isDefault: Bool
    let locAreaEncounters: String
    let moves: [Moves]
    let order: Int
    let species: NUStruct
    let sprites: sprite
    let statistics: [stats]
    let types: [stypes]
    
    
    enum CodingKeys: String, CodingKey{
        case name
        case height
        case weight
        case baseExperience = "base_experience"
        case abilities
        case forms
        case gameindices = "game_indices"
        case id
        case isDefault = "is_default"
        case locAreaEncounters = "location_area_encounters"
        case moves
        case order
        case species
        case sprites
        case statistics = "stats"
        case types
    }
    
    struct stypes: Decodable{
        let slot: Int
        let type: NUStruct
        
    }


    struct Moves: Decodable{
        let move: NUStruct
        let verGroupDetails: [VGDetails]
        
        enum CodingKeys: String, CodingKey{
            case move
            case verGroupDetails = "version_group_details"
        }
    }

    struct VGDetails: Decodable{
        let levelLearned: Int
        let moveLearnMethod: NUStruct
        let versionGroup: NUStruct

        enum CodingKeys: String, CodingKey {
            case levelLearned = "level_learned_at"
            case moveLearnMethod = "move_learn_method"
            case versionGroup = "version_group"
        }
    }

    

    struct stats: Decodable{
        let bstat: Int
        let effort: Int
        let statm: NUStruct
        enum CodingKeys: String, CodingKey{
            case bstat = "base_stat"
            case effort
            case statm = "stat"
        }
    }
    
    struct sprite: Decodable{
        let bdefault: URL
        let bfemale: URL?
        let bshiny: URL
        let bshinyf: URL?
        let fdefault: URL
        let ffemale: URL?
        let fshiny: URL
        let fshinyf: URL?

        enum CodingKeys: String, CodingKey{
            case bdefault = "back_default"
            case bfemale = "back_female"
            case bshiny = "back_shiny"
            case bshinyf = "back_shiny_female"
            case fdefault = "front_default"
            case ffemale = "front_female"
            case fshiny = "front_shiny"
            case fshinyf = "front_shiny_female"
        }


    }
    
    
    struct gIndices: Decodable{
        let gameIndex: Int
        let version: NUStruct
        
        enum CodingKeys: String, CodingKey{
            case gameIndex = "game_index"
            case version
        }
        
    }

    
    
    struct Ability: Decodable{
        let abilityContainer: NUStruct
        let isHidden: Bool
        let slot: Int
        
        enum CodingKeys: String, CodingKey {
            case abilityContainer = "ability"
            case isHidden = "is_hidden"
            case slot
        }
        
        
    }
    
    struct NUStruct: Decodable{
        let name: String
        let url: URL
    }
    
    
    //                vvvvvvvvvvvv usual dictionary initialization
    //init?(dictionary: [String: Any]){
       /* guard let pokemonName = dictionary["name"] as? String,
            let pokemonHeight = dictionary["height"] as? Int,
            let pokemonweight = dictionary["weight"] as? Int,
            let pokemonXP = dictionary["baseexperience"] as? Int else {return nil}
        self.name = pokemonName
        self.height = pokemonHeight
        self.weignt = pokemonweight
        self.baseExperience = pokemonXP
        self.abilities =
 */
    //}
}

//never force unwrap in an actual project (!)d
let url = Bundle.main.url(forResource: "PokemonExample",withExtension: "json")!
let data = try! Data(contentsOf: url)

/*
let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
let jsonDictionary = jsonObject as! [String: Any]
let pokemon = Pokemon(dictionary: jsonDictionary)
 */

let pokemon = try? JSONDecoder().decode(Pokemon.self,from: data)
//print(pokemon)//for testing purposes

let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/251")!
//         vvvvvv singleton
URLSession.shared.dataTask(with: apiURL) { (data, _, _) in
    let calledPokemon = try? JSONDecoder().decode(Pokemon.self, from: data!)
    print(calledPokemon)
}.resume()

//Creating a singleton
class PokemonMaster{
    static let shared = PokemonMaster()
    
    private init(){
        
    }
}

print (PokemonMaster.shared)
