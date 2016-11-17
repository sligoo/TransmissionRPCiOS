//
//  RPC-API.swift
//  TransmissionRemote
//
//  Created by Alexandre Jouandin on 17/11/2016.
//  Copyright © 2016 Sacha Liguori. All rights reserved.
//

import Foundation
import JSONRPCKit

// MARK: Torrent Action Requests

/// An ID is an integer that refers to a torrent ID
typealias ID = Int

/// Represents the "torrent-start" method
struct TorrentStartRequest: Request {
    typealias Response = ()
    
    let ids: [ID]
    
    var method: String {
        return "torrent-start"
    }
    
    var parameters: Any? {
        return ["ids": ids]
    }
    
    func response(from resultObject: Any) throws -> Response { }
}

/// Represents the "torrent-start-now" method
struct TorrentStartNowRequest: Request {
    typealias Response = ()
    
    let ids: [ID]
    
    var method: String {
        return "torrent-start-now"
    }
    
    var parameters: Any? {
        return ["ids": ids]
    }
    
    func response(from resultObject: Any) throws -> Response { }
}

struct CountCharactersResponse {
    let count: Int
    
    init(object: AnyObject) throws {
        enum DecodeError: Error {
            case MissingValueForKey(String)
        }
        
        if let count = object["count"] as? Int {
            self.count = count
        } else {
            throw DecodeError.MissingValueForKey("count")
        }
    }
}
