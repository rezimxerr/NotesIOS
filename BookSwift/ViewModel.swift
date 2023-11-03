//
//  ViewModel.swift
//  BookSwift
//
//  Created by Khakim on 02/11/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    init() {
        fetchPost()
    }
    
    //MARK: - retrieve data
    func fetchPost(){
        guard let url = URL(string: "\(prefixUrl)/posts") else{
            print("NOT FOUND URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription ?? "")
                return
            }
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else{
                    print("No Data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    
    //MARK: - created data
    func createPost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/createPost") else{
            print("NOT FOUND URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription ?? "")
                return
            }
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else{
                    print("No Data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    
    //MARK: - update data
    func updatePost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/updatePost") else{
            print("NOT FOUND URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription ?? "")
                return
            }
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else{
                    print("No Data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    
    //MARK: - delete data
    func deletePost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/deletePost") else{
            print("NOT FOUND URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil{
                print("error", error?.localizedDescription ?? "")
                return
            }
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else{
                    print("No Data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
}
