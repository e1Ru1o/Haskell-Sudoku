module Game
( pipeline
) where

import Utils
import SudokuTypes
import Data.List (nub, (\\), sort, concat)

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
    | otherwise        = [1..9]
    where
        cells = filter (affinity target) table

-- Pipeline
pipeline :: Sudoku -> Sudoku
pipeline sudoku
    | done sudoku   = sudoku
    | otherwise     = pipeline $ fillACell sudoku

fillACell :: Sudoku -> Sudoku
fillACell sudoku =
    let Sudoku a b = sudoku in
    (\(_, v, cell) -> moveCell sudoku cell v) $ head $ sort $ 
    map (\(v:r, cell) -> ((length r) + 1, v, cell)) [(related b cell, cell) | cell <- a]

moveCell :: Sudoku -> Cell -> Int -> Sudoku
moveCell s cell v = 
    let Sudoku a b = s 
    in  Sudoku (a \\ [cell]) (changeValue cell v : b)