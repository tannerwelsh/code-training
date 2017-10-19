function evaluate(expr, env) {
  // env = 

  switch (expr.type) {
    case 'value':
      return expr.value
    case 'word':
      if (expr.name in env)
        return env[expr.name]
      else
        throw new ReferenceError(`Undefined variable: ${expr.name}`)
    case 'apply':
      if (expr.operator.type === 'word' && expr.operator.name in specialForms)
        return specialForms[expr.operator.name](expr.args, env)

      let op = evaluate(expr.operator, env)

      if (typeof op !== 'function')
        throw new TypeError('Applying a non-function')
      return op.apply(null, expr.args.map(arg => evaluate(arg, env)))
    default:

  }
}

const specialForms = Object.create(null)

if (!module.parent) {
  const parse = require('./parser')

  const compareExpression = ">(x, 5)"

  console.log(evaluate(parse(compareExpression)));
}
