## Composing ServerParts

In this section, the F# Applied book shows how to compose Suave WebParts using a new function whit the type `WebPart -> WebPart -> WebPart` applying the first WebPart and matching the result with Success (some) and "chaining" the result to the following WebPart. At the end build an operator `>=>` using the previous function.

In Haskell we have that operator, [`>=>`](http://hackage.haskell.org/package/base-4.9.0.0/docs/Control-Monad.html#v:-62--61--62-) so, we can apply this composition with ServerParts only adding the `import Control.Monad`
