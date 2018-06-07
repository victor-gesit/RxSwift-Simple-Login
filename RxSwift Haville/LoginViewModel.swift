//
//  LoginViewModel.swift
//  RxSwift Haville
//
//  Created by Victor Idongesit on 05/06/2018.
//  Copyright © 2018 Victor Idongesit. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(
            emailText.asObservable(),
            passwordText.asObservable()){ email, password in
                email.count >= 3 && password.count > 3
        }
    }
}
