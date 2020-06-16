suffix :: Eq a => [a] -> [a] -> Maybe [a]
suffix [] ys = Just ys
suffix lx@(x:xs) ly@(y:ys) = suffixStart lx ly index 
    where
        index = findIndex x ly

suffixStart :: Eq a => [a] -> [a] -> Maybe Int -> Maybe [a]
suffixStart _ _ Nothing = Nothing
suffixStart lx@(x:xs) ly@(y:ys) (Just n) = suffixWork lx ly_start
    where ly_start = drop n ly

suffixWork :: Eq a => [a] -> [a] -> Maybe [a]
suffixWork (x:xs) (y:ys)
    | x /= y = Nothing
    | otherwise = suffixWork xs ys
suffixWork [] ys = Just ys

findIndex :: Eq a => a -> [a] -> Maybe Int
findIndex x l@(y:ys) =
    if elem x l then
        if x == y then
            Just 0
        else
            do
                n <- findIndex x ys
                return (n + 1)
    else
        Nothing

findIndex :: Eq a => [a] -> [a] -> Maybe Int
findIndex [] ys = Just 0
findIndex (x:xs) (y:ys)
    | x /= y = do
        n1 <- findIndex (x:xs) ys
        return (n1 + 1)
    | otherwise = 