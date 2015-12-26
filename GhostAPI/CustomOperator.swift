//
//  CustomOperator.swift
//  GhostAPI
//
//  Created by huchunbo on 15/12/27.
//  Copyright © 2015年 Bijiabo. All rights reserved.
//

import Foundation

func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}