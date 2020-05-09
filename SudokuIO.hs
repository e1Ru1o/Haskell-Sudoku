module SudokuIO
( loadSudoku
, formatSudoku
) where

import Utils
import System.IO
import SudokuTypes
import Data.Char (digitToInt)
import Data.List (lines, partition, concat, splitAt, intersperse, sort, all, (\\), zip, zip3)

loadSudoku :: String -> Sudoku
loadSudoku file
    | sz == 9       = Sudoku empty full 
    | otherwise     = error "Invalid number of lines"
    where 
        content = lines file
        sz = length content
        ceros = partition ((==0) . value)
        tables = [ceros (loadTable l n) | (l, n) <- zip content [0..]]
        empty = concat [a | (a, b) <- tables]
        full = concat [b | (a, b) <- tables]

loadTable :: String -> Int -> Table
loadTable rawLine n
    | (length nums == 9)    = [Cell a b c | (a, b, c) <- zip3 (repeat n) [0..8] nums] 
    | otherwise             = error ("Line number " ++ show n ++ " are badformed")
    where 
        nums = [digitToInt c | c <- rawLine, elem c ['0'..'9']]
        sz = length nums
        single = all (<=1) [sz - (length $ nums \\ [i, i]) | i <- [1..9]]
        ok = (sz == 9) && single

formatSudoku :: Sudoku -> String
formatSudoku (Sudoku a b) = toOut $ map (head . show . value) $ sort $ concat [a, b]

toOut :: String -> String
toOut numbers
    | recursive = concat $ map (toOut) $ toList $ splitAt 9 numbers
    | otherwise = (intersperse ',' numbers) ++ "\n" 
    where recursive = (length numbers > 9)


   
