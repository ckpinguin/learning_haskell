type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs ((right + n) - left) < 4 = Just (left, right + n)
    | otherwise                    = Nothing

routine :: Maybe Pole
routine = do
    start <- return (0, 0)
    first <- landLeft 2 start
    Nothing -- banana peel ;-) -- the same as: _ <- Nothing
    second <- landRight 2 first
    landLeft 1 second