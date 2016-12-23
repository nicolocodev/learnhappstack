## Using `msum`

Writing the [latest example](https://github.com/nicolocodev/learnhappstack/tree/master/4_Filters) I made a mistake, or two, actually. I was confused by `mplus` and `msum`, yeah, `MonadPlus`, `mplus`, `msum`... (its funny 'cause the Happstack book shows and explains the `msum` function). After reading some blog posts and SO answers on how to implement my new Monad I figured out that all I had to do was [apply (`$`) the functions within the list](http://stackoverflow.com/a/27080683/1229323) `[ServerPart]`. So, I can't apply `msum` 'cause there is no any instance of `MonadPlus` for `(->) Context` but there is one for `Maybe`. Yeah, doesn't look like Happstack, but I think that's why they built those monads. So, by now, I'll be using the Suave (F# Applied) way but:

- The execute in loop function build out the initial Context
- The `choose` function uses `msum` only cause I can! :P `choose app ctxt = msum $ map ($ ctxt) app`  