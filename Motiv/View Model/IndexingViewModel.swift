//
//  IndexingViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-05-03.
//

import Foundation
import Firebase
import AlgoliaSearchClient
import Combine


class IndexingViewModel: ObservableObject {
    
    
    // MARK: Algolia Services
    private let client: SearchClient
    private let userIndex: Index
    
    @Published var searchText: String = ""
    @Published var users: [User] = [User(id: "", name: "name", username: "username", program: "program", school: "school", friends: [], requests: [], houseUID: "", profilePhoto: "", inHouse: false)]
    var cancellable: AnyCancellable?
    
    // MARK: Firebase Services
    private let db = Firestore.firestore()
            
    // MARK: Required to parse JSON data from Algolia Search API Call
    struct Hit: Codable {
        
        let objectID: String
        let name: String?
        let username: String?
        let program: String?
        let school: String?
        let friends: [String]?
        let requests: [String]?
        let profilePhoto: String?
        let id: String?
        
    }
    
    init() {
        
        // MARK: Initializes Algolia Client
        self.client = SearchClient(appID: "NAW4Z6IS9L", apiKey: "35451fd87ebb6dbbf8bf2e74633a7521")
        self.userIndex = client.index(withName: "w-little_motivapp_users")
        
        // MARK: Search textfield Watching
        cancellable = $searchText
            .debounce(for: .seconds(0.25), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                if value != "" {
                    self.users = []
                    self.searchUsers(value) { userList in
                        for user in userList {
                            if !self.users.contains(user) {
                                self.users.append(user)
                            }
                        }
                    }
                    print("setting users array: \(self.users)")
                } else {
                    self.users = []
                }
            })
    }
    
    

    // MARK: Fetches Algolia App ID from database
    // MARK: Will switch to HTTPS Request in future for security
    private func algoliaAppID() -> String {
        
        var appID = ""
                
        db.collection("keys").document("ALGOLIA_APP_ID").getDocument { doc, err in
            if let err = err {
                print("Error fetching Algolia App ID: \(err.localizedDescription)")
            }
            
            if let data = doc?.data() {
                
                // MARK: Must be set in Firestore
                appID = data["APP_ID"] as? String ?? "App ID Not Found"
            } else {
                print("Error fetching Algolia APP ID: Field is non-existent")
            }
            
        }
        
        return appID
    }
    
    
    // MARK: Fetches Algolia App ID from database
    // MARK: Will switch to HTTPS Request in future for security
    private func algoliaAPIKey() -> String {
        
        var apiKey = ""
                
        db.collection("keys").document("ALGOLIA_API_KEY").getDocument { doc, err in
            if let err = err {
                print("Error fetching Algolia API Key: \(err.localizedDescription)")
            }
            
            if let data = doc?.data() {
                
                // MARK: Must be set in Firestore
                apiKey = data["API_KEY"] as? String ?? "API Key Not Found"
            } else {
                print("Error fetching Algolia API Key Field is non-existent")
            }
            
        }
        
        return apiKey
    }
    
    
    // MARK: Hard Coded Dummy Users for Testing Purposes
    let dummyUsers: [User] = [
        User(id: UUID().uuidString, name: "John Doe", username: "jDoe", program: "Economics", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_1.jpeg?alt=media&token=1e85f082-dfe6-48ca-94d4-f4f615ed53cc", inHouse: false),
        User(id: UUID().uuidString, name: "Dylan Brown", username: "Brown23", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_2.jpeg?alt=media&token=1d42756a-4442-42b5-a963-508963deec0d", inHouse: false),
        User(id: UUID().uuidString, name: "Mike Reynolds", username: "Slydes123", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_3.jpeg?alt=media&token=d4f0d64d-aecf-4755-9d3e-e5ee30275878", inHouse: false),
        User(id: UUID().uuidString, name: "William Little", username: "willskates", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_4.jpeg?alt=media&token=ece0d5ea-f8fc-4207-880c-569b4e4aa122", inHouse: false),
        User(id: UUID().uuidString, name: "Jason Bourne", username: "JBourne69", program: "Arts", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_5.jpeg?alt=media&token=92eee1e4-cdd8-4bd2-ad92-d143ecc894f5", inHouse: false),
        User(id: UUID().uuidString, name: "Tyler Dawn", username: "TDog", program: "Sociology", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_6.jpeg?alt=media&token=90257e6a-bbcc-49c1-bdc1-016c952903fe", inHouse: false),
        User(id: UUID().uuidString, name: "Heet Kantaria", username: "Heet", program: "Economics", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_7.jpeg?alt=media&token=953361b3-0255-47d8-b713-2692f82a5d18", inHouse: false),
        User(id: UUID().uuidString, name: "Will", username: "bigwilly", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_8.jpeg?alt=media&token=a4401a6c-6412-40dd-a2ef-9c6d992cbd28", inHouse: false),
        User(id: UUID().uuidString, name: "Lily", username: "lilyyy", program: "Communications", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_9.jpeg?alt=media&token=ca71b62b-69f3-48ab-8454-9d49ef44ccc4", inHouse: false),
        User(id: UUID().uuidString, name: "John B", username: "johnb", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_10.jpeg?alt=media&token=bd059d18-f1d7-4d9e-8018-4ff456974cbd", inHouse: false)
    ]
    
    func searchUsers(_ query: String, _ completion: @escaping ([User]) -> Void) {
        
        var users: [User] = []
        
        
        var query = Query(query)
        query.hitsPerPage = 30
        
        DispatchQueue.main.async {
            self.userIndex.search(query: query) { serverResponse in
                switch serverResponse {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let result):
                    let hits: [Hit]? = try? result.extractHits()
                    
                    for hit in hits! {
                        
                        // TODO: Only append if user is not in a house
                        users.append(User(id: hit.id ?? "", name: hit.name ?? "", username: hit.username ?? "", program: hit.program ?? "", school: hit.school ?? "", friends: hit.friends ?? [], requests: hit.requests ?? [], houseUID: "", profilePhoto: hit.profilePhoto ?? "", inHouse: false))
                        
                        print("Returning: \(users)")
                        completion(users)
                    }
                }
            }
        }
    }
    
    // MARK: Searches users stored in Algolia User Index
//    func searchUsers(_ query: String) -> [User] {
//
//        var users: [User] = []
//
//
//        var query = Query(query)
//        query.hitsPerPage = 30
//
//        DispatchQueue.main.async {
//            self.userIndex.search(query: query) { serverResponse in
//                switch serverResponse {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let result):
//                    let hits: [Hit]? = try? result.extractHits()
//
//                    for hit in hits! {
//
//                        // TODO: Only append if user is not in a house
//                        users.append(User(id: hit.id ?? "", name: hit.name ?? "", username: hit.username ?? "", program: hit.program ?? "", school: hit.school ?? "", friends: hit.friends ?? [], requests: hit.requests ?? [], houseUID: "", profilePhoto: hit.profilePhoto ?? "", inHouse: false))
//
//                        print("Returning: \(users)")
//                    }
//                }
//            }
//        }
//
//        print("Returning: \(users)")
//        return users
//
//    }
//
    // MARK: DO NOT CALL MORE THAN ONCE - FLOODS DATABASE
    func uploadDummyUsers() {
        
        DispatchQueue.main.async {
            for var i in 0...self.dummyUsers.count - 1 {
                
                let user = self.dummyUsers[i]
                
                Firestore.firestore().collection("users").document(user.id).setData([
                    "id" : user.id,
                    "name" : user.name,
                    "username" : user.username,
                    "program" : user.program,
                    "school" : user.school,
                    "friends" : user.friends,
                    "requests" : user.requests,
                    "houseUID" : user.houseUID,
                    "profilePhoto" : user.profilePhoto
                ])
            }
            
            print("Added dummy users!")
        }
        
        
        
    }
    
}
