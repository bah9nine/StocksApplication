//
//  DetailedViewIO.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import Foundation

protocol DetailedViewInput: AnyObject, BaseViewInput {
    func setupInitialState()
    func getIcon()
    func setupIcon(url: URL) 
}

protocol DetailedViewOutput {
    func viewIsReady()
    func getIcon(by symbol: String) 
}
