//
//  TestHelpers.swift
//  AssertThrows
//
// Copyright (c) 2016 Witold Skibniewski (http://mr-v.github.io/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation


enum MovieType {
    case NewRelease, Children, Unkown
}

enum TestError: ErrorType {
    case IllegalArgument
    case NoLuck
}

enum AnotherTestError: ErrorType {
    case WhatsUp
}

struct Movie {
    func throwOnUnkown(type: MovieType) throws {
        if type == .Unkown {
            throw TestError.IllegalArgument
        }
    }

    func throwsBaseError() throws {
        throw WSBaseError(domain: "witold.skibniewski", code: 0, userInfo: nil)
    }

    func throwsDerivedError() throws {
        throw WSDerivedError(domain: "witold.skibniewski", code: 1, userInfo: nil)
    }


    func dontThrow() {
    }
}

class WSBaseError: NSError {
}

class WSDerivedError: WSBaseError {
}
