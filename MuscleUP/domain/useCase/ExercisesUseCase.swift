//
//  ExercisesUseCase.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 1/10/23.
//

import Foundation

enum FetchExercisesDataUseCaseError: Error {
    case noData
    case parseError
    case generalError
    case sessionError
}

typealias FetchExercisesDataHandler <T> = (Result<T, FetchExercisesDataUseCaseError>) -> Void

protocol FetchExercisesDataUseCaseProtocol: UseCaseProtocol { }

struct FetchExercisesDataUseCase: UseCaseProtocol {
    var completion: FetchExercisesDataHandler<ExercisesEntity> = { _ in }
    
    func execute() {
        completion(.failure(.noData))
    }
    
   

}
