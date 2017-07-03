//
//  AssertThrowsTestCase.swift
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

import XCTest
import AssertThrows

class AssertThrowsTestCase: XCTestCase {
    func test_AssertsThrowingAnyError() {
        let movie = Movie()
        AssertThrows(try movie.throwOnUnkown(.unkown))
    }

    func test_AssertsThrowingNSError() {
        let movie = Movie()
        AssertThrows(try movie.throwsBaseError())
    }

    func test_AssertsThrowingSpecificType() {
        let movie = Movie()
        AssertThrows(TestError.self, try movie.throwOnUnkown(.unkown))
    }

    func test_AssertThrows_ThrowingSpecificCaseOfType() {
        let movie = Movie()
        AssertThrows(TestError.illegalArgument, try movie.throwOnUnkown(.unkown))
    }

    func test_AssertsThrowingSpecificNSError_MatchesErrorClass() {
        let movie = Movie()
        AssertThrows(WSBaseError.self, try movie.throwsBaseError())
    }

    func test_AssertsThrowingSpecificNSError_MatchesDerivedClassWithSuperclass() {
        let movie = Movie()
        AssertThrows(WSBaseError.self, try movie.throwsDerivedError())
    }
}
