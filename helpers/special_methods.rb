def step(name, *args)
  yield(*args)
end

def required_relative_all(path)
  dir = __dir__.split("/")
  root = dir[0..dir.length-2].join("/")
  Dir[root + path].each { |file| require_relative file }
end