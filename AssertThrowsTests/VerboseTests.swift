//
//  AssertThrowsTests.swift
//  AssertThrowsTests
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


class AssertThrowsTests: XCTestCase {
    func test_throwOnUnkown_UnknownPassed_ThrowsAnyError() {
        do {
            try Movie().throwOnUnkown(.Unkown)
            XCTFail()
        } catch {

        }
    }

    func test_throwOnUnkown_UnknownPassed_ThrowsTestError() {
        do {
            try Movie().throwOnUnkown(.Unkown)
            XCTFail()
        } catch {
            guard let _ = error as? TestError else {
                return XCTFail()
            }
        }
    }

    func test_throwOnUnkown_UnknownPassed_ThrowsIllegalArgument() {
        do {
            try Movie().throwOnUnkown(.Unkown)
            XCTFail()
        } catch {
            guard let error = error as? TestError else {
                return XCTFail()
            }
            XCTAssertEqual(TestError.IllegalArgument, error)
        }
    }
}
