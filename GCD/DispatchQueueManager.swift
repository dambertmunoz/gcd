//
//  DispatchQueueManager.swift
//  GCD
//
//  Created by Dambert Muñoz on 16/07/21.
//

import Foundation
import Dispatch

public class DispatchQueueManager{
    
    
    static let shared = DispatchQueueManager()
    
    var qos: DispatchQoS.QoSClass = .background
    
    public init(){
        
    }
    
    public func setQoS(qos: DispatchQoS.QoSClass)-> DispatchQueueManager{
        self.qos = qos
        return self
    }
    public func globalAsync(qualityOfService:DispatchQoS.QoSClass? = nil, execute work: @escaping @convention(block) () -> Void ){
        DispatchQueue.global(qos: qualityOfService ?? self.qos).async(execute: work)
    }
    
    public func globalAsync(qualityOfService:DispatchQoS.QoSClass? = nil, execute work: DispatchWorkItem){
        DispatchQueue.global(qos: qualityOfService ?? self.qos).async(execute: work)
    }
    
    
    
    
    
    
}
