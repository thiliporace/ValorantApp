import Foundation
import CoreData

class DataController: ObservableObject {
    
    static let shared = DataController()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error)")
            }
        }
    }
    
    func getAllMatches() -> [FavoriteModel] {
        let request = NSFetchRequest<FavoriteModel>(entityName: "FavoriteModel")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print("Error fetching FAVORITE_MODEL: \(error)")
        }
        return []
    }
    
    func saveContext(){
        guard persistentContainer.viewContext.hasChanges else { return }
        do {
          try persistentContainer.viewContext.save()
        } catch {
          print("Faild to save the context: ", error.localizedDescription)
        }
      }
    
    func createMatch(seriesLabel: String, date: String, country_flag1: String, country_flag2: String, team_name1: String, team_name2: String, game_time: String, time_from_now: String) {
        if let step = NSEntityDescription.insertNewObject(forEntityName: "FavoriteModel", into: self.persistentContainer.viewContext) as? FavoriteModel {
          step.seriesLabel = seriesLabel
          step.date = date
          step.country_flag1 = country_flag1
          step.country_flag2 = country_flag2
          step.team_name1 = team_name1
          step.team_name2 = team_name2
          step.game_time = game_time
          step.time_from_now = time_from_now
          saveContext()
        }
      }
    func deleteMatch(match: FavoriteModel) {
        persistentContainer.viewContext.delete(match)
        saveContext()
      }
}
