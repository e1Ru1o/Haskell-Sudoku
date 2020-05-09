module Game
( pipeline
, check
) where

import Utils
import SudokuTypes
import Data.List ((\\), sort, concat, and)

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
    | length cells > 0 = [1..9] \\ (map value cells)
    | otherwise        = [1..9]
    where
        cells = filter (affinity target) table

-- Pipeline
pipeline :: Sudoku -> Sudoku
pipeline sudoku
    | done sudoku   = sudoku
    | otherwise     = pipeline $ fillACell sudoku

badSudoku = Sudoku [] [Cell 0 0 0]

fillACell :: Sudoku -> Sudoku
fillACell sudoku 
    | otherwise     = backtrack sudoku op cell
    where 
        Sudoku ceros nums = sudoku
        foo = map (\(a, b) -> (length a, a, b))
        relations = [(related nums cell, cell) | cell <- ceros]
        (cant, op, cell) = head $ sort $ foo relations

backtrack :: Sudoku -> [Int] -> Cell -> Sudoku
backtrack original l cell
    | l == []   = badSudoku 
    | correct   = sudoku
    | otherwise = backtrack original (tail l) cell
    where
        sudoku = pipeline $ moveCell original cell (head l)
        correct = (sudoku /= badSudoku)


-- fillACell :: Sudoku -> Sudoku
-- fillACell sudoku =
--     let Sudoku a b = sudoku in
--     (\(_, v, cell) -> moveCell sudoku cell v) $ head $ sort $ 
--     map (temp b) [(related b cell, cell) | cell <- a]

temp :: Table -> ([Int], Cell) -> (Int, Int, Cell)
temp s (l, c)
    | length l > 0 = let v:_ = l in ((length l) + 1, v, c)
    | otherwise    = let x = (error "\n" ++ show s ++ "\n" ++ show c ++ "\n") in (0, 0, c)


moveCell :: Sudoku -> Cell -> Int -> Sudoku
moveCell s cell v = 
    let Sudoku a b = s 
    in  Sudoku (a \\ [cell]) (changeValue cell v : b)

-- Sudoku checker
check :: Table -> Bool
check table = and [elem (value cell) (related (table \\ [cell]) cell) | cell <- table]