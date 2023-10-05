//
//  UseCase.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 1/10/23.
//

import Foundation

protocol UseCaseProtocol {
    associatedtype T
    var completion: T { get set }
    func execute() -> Void
}
