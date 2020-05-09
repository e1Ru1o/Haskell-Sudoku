module Game
(
) where

import Utils
import SudokuTypes
import Data.List (nub, (\\))

-- Cells affinity
affinity :: Cell -> Cell -> Bool
affinity (Cell a b c) (Cell d e f)
    | a == d      = True
    | b == e      = True 
    | byr && byc  = True
    | otherwise   = False
    where
        byr = ((a // 3) == (d // 3))
        byc = ((b // 3) == (e // 3))

related :: Table -> Cell -> [Int]
related table target
    | length cells > 0 = [1..9] \\ (nub $ map value cells)
    | otherwise        = []
    where
        cells = filter (affinity target) table


