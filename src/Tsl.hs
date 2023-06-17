import NapTokens
import NapGrammar
import NapTypes
import NapEval
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           --putStrLn ("Parsing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           --putStrLn ("Parsed as " ++ (show parsedProg) ++ "\n")
           --putStrLn ("Type Checking : " ++ (show parsedProg) ++ "\n")
           let typedProg = typeOf [] parsedProg

           if ( checkType typedProg ) then do
               result <- evalLoop parsedProg [[]]
               putStr (((unparse (fst result))))
               return ()
           else do
               return ()
        


checkType :: (NapType,TypeEnvironment)->Bool
checkType (NpPair _ _ , tenv) = True
checkType (NpList _ , tenv) = True
checkType (NpFun _ _ , tenv) = True
checkType (type1,tenv)| type1  == NpInt || type1 == NpBool || type1 == NpUnit || type1 == NpTile
                            || type1 == NpCell || type1 == NpNull = True
                     | otherwise = False
           

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()