module Game
(
) where

import SudokuTypes

-- Utils
(//) a b = a `div` b

-- Cells affinity
affinity :: Cell -> Cell -> Bool
affinity (Cell a b c) (Cell d e f)
    | a == d      = True
    | b == e      = True 
    | byr && byc  = True
    | otherwise   = False
    where	
        byr = ((a // 3) == (c // 3))
        byc = ((b // 3) == (d // 3))