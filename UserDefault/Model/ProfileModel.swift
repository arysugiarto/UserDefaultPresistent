//
//  ProfileModel.swift
//  UserDefault
//
//  Created by Ary Sugiarto on 09/02/23.
//

import Foundation

struct ProfileModel{
    static let stateLoginKey = "state"
    static let nameKey = "name"
    static let emailKey = "email"
    static let profesionKey = "profesion"
    
    
    static var stateLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: stateLoginKey)
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: stateLoginKey)
        }
    }
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    static var profesion: String {
        get {
            return UserDefaults.standard.string(forKey: profesionKey) ?? ""
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: profesionKey)
        }
    }
    
    static func deleteAll() -> Bool {
        if let domain = Bundle.main.bundleIdentifier{
            UserDefaults.standard.removePersistentDomain(forName: domain)
            synchronize()
            return true
        } else {return false}
    }
    
    static func synchronize() {
            UserDefaults.standard.synchronize()
        }
    
}
