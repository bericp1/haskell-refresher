module Main where

-- Utils

getLinesUntilBlank :: IO [String]
getLinesUntilBlank = do
  line <- getLine
  if null line
    then return []
    else do
      more <- getLinesUntilBlank
      return (line:more)

-- IO Actions

exit :: IO ()
exit = putStrLn "Sounds good! See you around!"

unknownLoop :: IO ()
unknownLoop = do
  putStrLn "Didn't quite catch that... What do you want to do?"
  getAndPerformAction

continueLoop :: IO ()
continueLoop = do
  putStrLn "Great! What would you like to do next?"
  getAndPerformAction

getAndPerformAction :: IO ()
getAndPerformAction = do
  action <- getLine
  case action of
    "wcl" -> countLinesAction
    "count lines" -> countLinesAction
    "lines" -> countLinesAction
    "" -> exit
    "exit" -> exit
    _ -> unknownLoop

countLinesAction :: IO ()
countLinesAction =  do
  putStrLn "Ok, I'll count the lines you enter! Just hit return on a blank line to finish."
  theirLines <- getLinesUntilBlank
  putStr $ "There were " ++ (show . length $ theirLines) ++ " lines in your input."
  continueLoop

-- Main

main :: IO ()
main = do
  putStrLn "Hey there! What do you want to do? (Enter 'exit' or hit return on a blank line to exit.)"
  getAndPerformAction

