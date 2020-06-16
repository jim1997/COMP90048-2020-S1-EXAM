data Suit = Clubs | Diamonds | Hearts | Spades deriving (Eq, Ord)

-- Define your types and functions below; do not edit above this line.
instance Show Suit where
    show Clubs = "C"
    show Diamonds = "D"
    show Hearts = "H"
    show Spades = "S"

data Bid = Pass | NoBid Int | Bid Suit Int
instance Show Bid where
    show Pass = "Pass"
    show (NoBid l) = (show l) ++ "NT"
    show (Bid s l) = (show l) ++ show s

toBid :: String -> Maybe Bid
toBid s = 
    case (filter (/=' ') s) of
        "Pass" -> Just Pass
        [l, s]-> do
            level <- toBidLevel l
            suit <- toBidSuit s
            return (Bid suit level)
        [l,'N', 'T'] -> do
            level <- toBidLevel l
            return (NoBid level)
        _->Nothing

bidSuit  :: Bid -> Maybe Suit
bidSuit Pass = Nothing
bidSuit (NoBid l) = Nothing
bidSuit (Bid s l) = Just s


bidLevel :: Bid -> Maybe Int
bidLevel Pass = Nothing
bidLevel (NoBid l)
    |l >= 0 && l <= 7 = Just l
    |otherwise = Nothing
bidLevel (Bid _ l)
    |l >= 0 && l <= 7 = Just l
    |otherwise = Nothing

toBidLevel :: Char -> Maybe Int
toBidLevel '1' = Just 1
toBidLevel '2' = Just 2
toBidLevel '3' = Just 3
toBidLevel '4' = Just 4
toBidLevel '5' = Just 5
toBidLevel '6' = Just 6
toBidLevel '7' = Just 7
toBidLevel _ = Nothing

toBidSuit :: Char -> Maybe Suit
toBidSuit 'C' = Just Clubs
toBidSuit 'D' = Just Diamonds
toBidSuit 'H' = Just Hearts
toBidSuit 'S' = Just Spades
toBidSuit _ = Nothing