'use strict'

class Cell {
  constructor(state, leftNeighbor, rightNeighbor) {
    this.leftNeighbor = leftNeighbor
    this.rightNeighbor = rightNeighbor
    this.state = state || 0
  }

  evolve(rule) {
    const newState = rule.compute(this.leftNeighbor.state, this.state, this.rightNeighbor.state)
    this.state = newState
  }
}

class Rule {
  constructor(outputs) {
    this.outputs = outputs
  }

  compute(l, c, r) {
    const stateNo = this.convertBinary([l, c, r].join(''))
    return this.outputs[stateNo]
  }

  convertBinary(binaryString) {
    return parseInt(binaryString, 2)
  }
}

const rule30 = new Rule([0,1,1,1,1,0,0,0])

const l = new Cell(0)
const r = new Cell(0)
const c = new Cell(0, l, r)
c.evolve(rule30)
console.log(c)
