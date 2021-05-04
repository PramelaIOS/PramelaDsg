//
//  parsedJson.swift
//  NestedparsedJson(seatGeekAPI)
//
//  Created by Pramela on 4/27/21.
//

import Foundation

struct Events:Decodable
{
    let type:String
    let id:Int
    let title: String
    let venue:LocationInfo
    let performers:[ImageLink]
}

struct LocationInfo: Codable
{
    let display_location:String!
    
}
struct ImageLink:Codable
{
    let image:String
}
struct Eventresponse:Decodable
{
    let events:[Events]
    
}
class JasonResponse
{
    let type:String
    let id:Int
    let title: String
    let venue:String
    let image:String
    init(type: String, id: Int,title: String, venue:String , image:String )
    {
         self.type = type
        self.id =  id
        self.title = title
        self.venue = venue
        self.image = image
       
     }
}





