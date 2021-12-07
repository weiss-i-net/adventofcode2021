import System.IO

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'

parseInput input = map (read::String->Int) (wordsWhen (==',') input)

getSumOfDistances :: [Int] -> Int -> Int
getSumOfDistances points goal = foldr (+) 0 (map (\x -> abs(goal - x)) points)

getSumOfDistancesSq :: [Int] -> Int -> Int
getSumOfDistancesSq points goal = foldr (+) 0 (map dist points)
                              where dist x = let d = abs(goal - x) in d*(d+1) `div` 2

main = do
    input <- getLine
    print $ minimum (map (getSumOfDistances (parseInput input)) [0..10000])
    print $ minimum (map (getSumOfDistancesSq (parseInput input)) [0..10000])
