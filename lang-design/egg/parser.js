const STRING_REGEXP = /^"([^"]*)"/
const NUMBER_REGEXP = /^\d+\b/
const WORD_REGEXP = /^[^\s(),"]+/

function parse(program) {
  const result = parseExpression(program)

  if (skipSpace(result.rest).length > 0)
    throw new SyntaxError("Unexpected text after program")

  return result.expr
}

function parseExpression(program) {
  program = skipSpace(program)
  let match, expr

  if (match = STRING_REGEXP.exec(program)) {
    expr = {type: "value", value: match[1]}
  } else if (match = NUMBER_REGEXP.exec(program)) {
    expr = {type: "value", value: Number(match[0])}
  } else if (match = WORD_REGEXP.exec(program)) {
    expr = {type: "word", name: match[0]}
  } else {
    throw new SyntaxError("Unexpected syntax: " + program)
  }

  return parseApply(expr, program.slice(match[0].length))
}

function parseApply(expr, program) {
  program = skipSpace(program);

  if (program[0] !== "(")
    return {expr: expr, rest: program}

  program = skipSpace(program.slice(1))
  expr = {type: "apply", operator: expr, args: []}

  while (program[0] !== ")") {
    const arg = parseExpression(program)
    expr.args.push(arg.expr)
    program = skipSpace(arg.rest)
    if (program[0] === ",") {
      program = skipSpace(program.slice(1))
    } else if (program[0] !== ")") {
      throw new SyntaxError("Expected ',' or ')'")
    }
  }
  return parseApply(expr, program.slice(1))
}

function skipSpace(str) {
  const first = str.search(/\S/)
  if (first === -1) return ""
  return str.slice(first)
}

module.exports = parse

if (!module.parent) {
  const compareExpression = ">(x, 5)"
  const multiplierExpression = "multiplier(2)(1)"
  const badMultiplierExpression = "multiplier(2) 1)"

  console.info(`Syntax tree for ${compareExpression}:\n`, parse(compareExpression))
  console.info(`Syntax tree for ${multiplierExpression}:\n`, parse(multiplierExpression))
  // console.info(`Syntax tree for ${badMultiplierExpression}:\n`, parse(badMultiplierExpression))

  // let testParse = parseExpression(compareExpression) === {
  //   type: 'apply',
  //   operator: {type: 'word', name: '>'},
  //   args: [
  //     {type: 'word', name: 'x'},
  //     {type: 'value', value: 5}
  //   ]
  // }
  // console.assert(testParse)
}
