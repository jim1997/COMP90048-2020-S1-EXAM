type Coord = (Int,Int)

data Movement = North Int
              | South Int
              | East  Int
              | West  Int
              | Teleport Coord         

-- Write your finalPosition function here.  Do not change anything above this line.

finalPosition :: Coord -> [Movement] -> Coord
finalPosition (x, y) [] = (x, y)
finalPosition (x, y) (m:ms) = finalPosition (helper (x, y) m) ms

helper :: Coord -> Movement -> Coord
helper (x, y) (North n) = (x, y + n)
helper (x, y) (South n) = (x, y - n)
helper (x, y) (East n) = (x + n, y)
helper (x, y) (West n) = (x - n, y)
helper (x, y) (Teleport (x1, y1)) = (x1, y1)