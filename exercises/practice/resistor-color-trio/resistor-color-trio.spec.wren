var makeLabel = Fn.new { |opts|
  return "Resistor value: %(opts["value"]) %(opts["unit"])"
}

import "./resistor-color-trio" for ResistorColorTrio
import "wren-testie/testie" for Testie, Expect

Testie.test("Resistor Color Trio") { |do, skip|
  do.test("Orange and orange and black") {
    Expect.value(ResistorColorTrio.new(["orange", "orange", "black"]).label).toEqual(
      makeLabel.call({ "value": 33, "unit": "ohms" })
    )
  }

  skip.test("Blue and grey and brown") {
    Expect.value(ResistorColorTrio.new(["blue", "grey", "brown"]).label).toEqual(
      makeLabel.call({ "value": 680, "unit": "ohms" })
    )
  }

  skip.test("Red and black and red") {
    Expect.value(ResistorColorTrio.new(["red", "black", "red"]).label).toEqual(
      makeLabel.call({ "value": 2, "unit": "kiloohms" })
    )
  }

  skip.test("Green and brown and orange") {
    Expect.value(ResistorColorTrio.new(["green", "brown", "orange"]).label).toEqual(
      makeLabel.call({ "value": 51, "unit": "kiloohms" })
    )
  }

  skip.test("Yellow and violet and yellow") {
    Expect.value(ResistorColorTrio.new(["yellow", "violet", "yellow"]).label).toEqual(
      makeLabel.call({ "value": 470, "unit": "kiloohms" })
    )
  }

  skip.test("Blue and violet and blue") {
    Expect.value(ResistorColorTrio.new(["blue", "violet", "blue"]).label).toEqual(
      makeLabel.call({ "value": 67, "unit": "megaohms" })
    )
  }

  skip.test("Minimum possible value") {
    Expect.value(ResistorColorTrio.new(["black", "black", "black"]).label).toEqual(
      makeLabel.call({ "value": 0, "unit": "ohms" })
    )
  }

  skip.test("Maximum possible value") {
    Expect.value(ResistorColorTrio.new(["white", "white", "white"]).label).toEqual(
      makeLabel.call({ "value": 99, "unit": "gigaohms" })
    )
  }

  skip.test("First two colors make an invalid octal number") {
    Expect.value(ResistorColorTrio.new(["black", "grey", "black"]).label).toEqual(
      makeLabel.call({ "value": 8, "unit": "ohms" })
    )
  }

  skip.test("Ignore extra colors") {
    Expect.value(ResistorColorTrio.new(["blue", "green", "yellow", "orange"]).label).toEqual(
      makeLabel.call({ "value": 650, "unit": "kiloohms" })
    )
  }

  // optional: error
  skip.test("Invalid color") {
    Expect.that {
      ResistorColorTrio.new(["yellow", "purple", "black"]).label
    }.abortsWith("invalid color")
  }
}
