//
//  File.swift
//  homeWork_1
//
//  Created by Пазин Даниил on 23.06.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation
import Alamofire

final class CommentsAdapterProxy: CommentsInterface {
    let comments: CommentsAdapter
    init(comments: CommentsAdapter) {
        self.comments = comments
    }
    
    func getComments(ownerId: Int, postId: Int, completion: @escaping ([VkComment]) -> Void) {
        Log(.sentRequest)
        self.comments.getComments(ownerId: ownerId, postId: postId, completion: completion)
        Log(.getResponse)
        Log(.result)
    }
}
