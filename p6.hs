suffix :: Eq a => [a] -> [a] -> Maybe [a]
suffix xs ys
    | xs_length > ys_length = Nothing
    | all (==False) xs_check_list = Nothing
    | otherwise = Just $ drop ys_index ys
    where
        xs_length = length xs
        ys_length = length ys
        l = [0..(ys_length - xs_length)]
        xs_check_list = map (\x -> all (==True) (zipWith (==) (drop x ys) xs)) l
        ys_index = xs_length + length (takeWhile (/=True) xs_check_list)
