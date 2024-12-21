main :: IO ()

main = do

  -- haskell range
  let rng = [1..42]
  print "rng"
  print rng

  -- -- infinite loop
  -- let nums = [1..]
  -- print nums

  -- no infinite loop
  let nums = [1..]
  print "ten"
  print 10

  -- lazy generation
  let nums = [1..]
  print "take 5 nums"
  print (take 5 nums)
