module SodukuTypes
( Sudoku
, done
, changeValue
) where

import Data.List

data Cell = Cell Int Int Int deriving(Eq, Ord)
type Table = [Cell]
data Sudoku = Sudoku Table Table

instance Show Cell where  
    show (Cell a b c) = "(" ++ (intercalate ", " (map (show) [a, b, c])) ++ ")"

done (Sudoku a _) = length a == 0

changeValue (Cell a b _) v = Cell a b v

