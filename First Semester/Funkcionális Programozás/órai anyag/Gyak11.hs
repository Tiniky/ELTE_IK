--------------------------
-- Maybe segédfüggvények--
--------------------------

isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _ = True

fromJust :: Maybe a -> a
fromJust (Just x) = x
fromJust Nothing = error "Nothing has no value"

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes ((Just x):xs) = x : catMaybes xs
catMaybes (_:xs) = catMaybes xs

mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe f xs = map f xs $ map  catMaybes xs

    
-- Reprezentáció    
    
type Username = String
type Password = String

data Privilege = Simple | Admin
    deriving (Eq, Show)
    
data Cookie = LoggedOut | LoggedIn Username Privilege
    deriving (Eq, Show)
    
data Entry = Entry Password Privilege [Username]
    deriving (Eq, Show)
    
type Database = [(Username, Entry)]

-- Példa adatok

richard, charlie, carol, david, kate :: (Username, Entry)
richard = ("Richard", Entry "password1" Admin ["Kate"])
charlie = ("Charlie", Entry "password2" Simple ["Carol"])
carol = ("Carol", Entry "password3" Simple ["David", "Charlie"])
david = ("David", Entry "password4" Simple ["Carol"])
kate = ("Kate", Entry "password5" Simple ["Richard"])
testDB :: Database
testDB = [ richard, charlie, carol, david, kate ]
testDBWithoutCarol :: Database
testDBWithoutCarol =
    [ ("Richard", Entry "password1" Admin ["Kate"])
    , ("Charlie", Entry "password2" Simple [])
    , ("David", Entry "password4" Simple [])
    , ("Kate", Entry "password5" Simple ["Richard"])
    ]
 
------------------------ 
-- Szelektorfüggvények--
------------------------

password :: Entry -> Password  
password (Entry pwd _ _) = pwd

privilege :: Entry -> Privilege
privilege (Entry _ priv _) = priv

friends :: Entry -> [Username]
friends (Entry _ _ fr) = fr

-------------------------
-- Adatbázis műveletek --
-------------------------

mkCookie :: Username -> Password -> Entry -> Cookie
mkCookie user pwd (Entry a b c)
    | pwd == a = LoggedIn user b
	| otherwise = LoggedOut
    
login :: Username -> Password -> Database -> Cookie
login user pwd db = maybe LoggedOut (mkCookie user pwd) (lookup user db)

--updateEntry :: Username -> (Username, Entry) -> Maybe (Username, Entry)


--deleteUser :: Cookie -> Username -> Database -> Database
