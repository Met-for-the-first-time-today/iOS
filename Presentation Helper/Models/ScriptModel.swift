//
//  ScriptModel.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import Foundation

class ScriptModel {
    /// 글 인덱스 (ID)
    var index: Int = -1
    /// 글 작성일
    var date: String = ""
    /// 제목
    var title: String = ""
    /// 대본 내용
    var script: String = ""
    /// 지속시간
    var duration: String = ""
    /// 배속 정보
    var speed: Float = 0.0
}
