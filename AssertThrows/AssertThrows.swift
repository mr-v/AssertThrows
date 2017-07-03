//
//  AssertThrows.swift
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
import XCTest


/// Asserts that error has been thrown.
public func AssertThrows(_ throwingCall: @autoclosure () throws -> Any, file: StaticString = #file, line: UInt = #line) {
    do {
        _ = try throwingCall()
        XCTFail("AssertThrows: No error thrown", file: file, line: line)
    } catch {

    }
}

/// Asserts that error of specific type has been thrown.
public func AssertThrows<T: Error>(_ type: T.Type, _ throwingCall: @autoclosure () throws -> Any, file: StaticString = #file, line: UInt = #line) {
    do {
        _ = try throwingCall()
        XCTFail("AssertThrows: No error thrown", file: file, line: line)
    } catch {
        guard error is T else {
            return XCTFail("AssertThrows: (\"\(type(of: error))\") is not of type (\"\(T.self)\")", file: file, line: line)
        }
    }
}

/**
    Asserts that error of specific `Equatable` type has been thrown, e.g.
    - Swift enums with associated data,
    - `NSError`s, where default equality verification relies on checking `code`, `domain` and `userInfo` properties.
*/
public func AssertThrows<T>(_ expected: T, _ throwingCall: @autoclosure () throws -> Any, file: StaticString = #file, line: UInt = #line) where T: Equatable, T: Error {
    do {
        _ = try throwingCall()
        XCTFail()
    } catch {
        guard let castedError = error as? T,  expected == castedError else {
            return XCTFail("AssertThrows: (\"\(type(of: expected)) \(expected)\") is not equal to (\"\(error)\")", file: file, line: line)
        }
    }
}
