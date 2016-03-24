//
//  RecordedAudio.swift
//  PitchPerfect
//
//  Created by Mitch Murphy on 3/20/16.
//  Copyright © 2016 Mitch Murphy. All rights reserved.
//

import Foundation


class RecordedAudio: NSObject {
    var filePath: NSURL!
    var title: String!
    
    init(path: NSURL, title: String) {
        self.filePath = path
        self.title = title
    }
}