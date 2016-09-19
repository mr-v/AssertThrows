[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# AssertThrows
Custom assertions for unit testing throwing functions in Swift 2.2. For more information see [blog post](http://mr-v.github.io/custom-error-assertions-in-swift/).

## Usage

Custom assertions enable following tests:

1. Throws error.
2. Throws specific `ErrorType` implementer.
3. Throws specific case of `ErrorType` implementer.*



Sample usage:

```swift
func test_AssertsThrowingAnyError() {
    let movie = Movie()
    AssertThrows(try movie.throwOnUnkown(.Unkown))
}

func test_AssertsThrowingSpecificType() {
    let movie = Movie()
    AssertThrows(TestError.self, try movie.throwOnUnkown(.Unkown))
}

func test_AssertThrows_ThrowingSpecificCaseOfType() {
    let movie = Movie()
    AssertThrows(TestError.IllegalArgument, try movie.throwOnUnkown(.Unkown))
}
```

There's one caveat - `ErrorType` conforming enumerations with associated data must also implement `Equatable` protocol to be verified with `AssertThrows`. Standard enums have it for free.


Custom assertions fix issues with vanilla XCTest tests that may have looked like this:

```swift
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
```

## Installation

### CocoaPods

In `Podfile` add AssertThrows to test target, e.g.

```ruby
target 'AppTests' do
pod 'AssertThrows'
end
```

### Carthage

Add to `Cartfile`:

`github "mr-v/AssertThrows"`

Drag the built .framework binary into your application’s test target.
