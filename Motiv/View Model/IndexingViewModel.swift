//
//  IndexingViewModel.swift
//  Motiv
//
//  Created by William Little on 2022-05-03.
//

import Foundation
import Firebase
import AlgoliaSearchClient


class IndexingViewModel: ObservableObject {
    
    
    let client: SearchClient
    let index: Index
    
    @Published var users = [User]()
    
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
    
    // MARK: Initializes Algolia Client and Index
    init() {
        self.client = SearchClient(appID: "NAW4Z6IS9L", apiKey: "35451fd87ebb6dbbf8bf2e74633a7521")
        self.index = client.index(withName: "w-little_motivapp_users")
    }
    
    
    // MARK: Dummy Users for Testing Purposes
    let dummyUsers: [User] = [
        User(id: UUID().uuidString, name: "John Doe", username: "jDoe", program: "Economics", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_1.jpeg?alt=media&token=1e85f082-dfe6-48ca-94d4-f4f615ed53cc"),
        User(id: UUID().uuidString, name: "Dylan Brown", username: "Brown23", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_2.jpeg?alt=media&token=1d42756a-4442-42b5-a963-508963deec0d"),
        User(id: UUID().uuidString, name: "Mike Reynolds", username: "Slydes123", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_3.jpeg?alt=media&token=d4f0d64d-aecf-4755-9d3e-e5ee30275878"),
        User(id: UUID().uuidString, name: "William Little", username: "willskates", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_4.jpeg?alt=media&token=ece0d5ea-f8fc-4207-880c-569b4e4aa122"),
        User(id: UUID().uuidString, name: "Jason Bourne", username: "JBourne69", program: "Arts", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_5.jpeg?alt=media&token=92eee1e4-cdd8-4bd2-ad92-d143ecc894f5"),
        User(id: UUID().uuidString, name: "Tyler Dawn", username: "TDog", program: "Sociology", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_6.jpeg?alt=media&token=90257e6a-bbcc-49c1-bdc1-016c952903fe"),
        User(id: UUID().uuidString, name: "Heet Kantaria", username: "Heet", program: "Economics", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_7.jpeg?alt=media&token=953361b3-0255-47d8-b713-2692f82a5d18"),
        User(id: UUID().uuidString, name: "Will", username: "bigwilly", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_8.jpeg?alt=media&token=a4401a6c-6412-40dd-a2ef-9c6d992cbd28"),
        User(id: UUID().uuidString, name: "Sarah Cameron", username: "johnnysins", program: "Communications", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_9.jpeg?alt=media&token=ca71b62b-69f3-48ab-8454-9d49ef44ccc4"),
        User(id: UUID().uuidString, name: "John B", username: "sarahcameron", program: "Engineering", school: "Queen's University", friends: [], requests: [], houseUID: "", profilePhoto: "https://firebasestorage.googleapis.com/v0/b/motiv-349217.appspot.com/o/profile_pic_10.jpeg?alt=media&token=bd059d18-f1d7-4d9e-8018-4ff456974cbd")
    ]
    
    
    func searchUsers(_ query: String) {
        
        self.users = []
        
        
        var query = Query(query)
        query.hitsPerPage = 30
        
        DispatchQueue.main.async {
            self.index.search(query: query) { serverResponse in
                switch serverResponse {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let result):
                    let hits: [Hit]? = try? result.extractHits()
                    
                    for hit in hits! {
                        print("Found ", hit.username!)
                        self.users.append(User(id: hit.id ?? "", name: hit.name ?? "", username: hit.username ?? "", program: hit.program ?? "", school: hit.school ?? "", friends: hit.friends ?? [], requests: hit.requests ?? [], houseUID: "", profilePhoto: hit.profilePhoto ?? ""))
                    }
                    print(self.users)
                    return
                }
            }
        }
    }
    
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