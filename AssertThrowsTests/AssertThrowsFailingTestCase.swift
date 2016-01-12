//
//  AssertThrowsFailingTestCase.swift
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

/// Tests failing on purpose didn't figure out how to catch their failures.
//class AssertThrowsFailingTestCase: XCTestCase {
//    func test_NonDerivedTypeAssertionFails() {
//        let movie = Movie()
//        AssertThrows(WSDerivedError.self, try movie.throwsBaseError())
//    }
//
//    func test_NotMatchingCaseFails() {
//        let movie = Movie()
//        AssertThrows(TestError.NoLuck, try movie.throwOnUnkown(.Unkown))
//    }
//
//    func test_NotMatchingTypeFails() {
//        let movie = Movie()
//        AssertThrows(AnotherTestError.self, try movie.throwOnUnkown(.Unkown))
//    }
//
//    func test_NotMatchingTypeAndCaseFails() {
//        let movie = Movie()
//        AssertThrows(AnotherTestError.WhatsUp, try movie.throwOnUnkown(.Unkown))
//    }
//
//    func test_AssertThrows_CantAssertNonThrowingFunction() {
//        let movie = Movie()
//        AssertThrows(AnotherTestError.self, movie.dontThrow())
//    }
//}
