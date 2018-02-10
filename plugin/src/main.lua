_ = require('../lua_modules/lodash')

_.add = function(left, right)
  return left + right
end

_.sum = function(array)
  return _.reduce(array, _.add)
end

_.sumBy = function(array, path)
  return _.sum(_.pluck(array, path))
end
