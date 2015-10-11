module PurescriptTest where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

-- | Effect for modifying/working with the Atom API.
foreign import data ATOM :: !

-- | Exposes an AtomPackage so it can be used.
foreign import expose :: forall e1. AtomPackage -> Eff e1 Unit

-- | Adds a new command to the workspace.
foreign import addTextEditorCommand :: forall e1 e2 a. String ->
                                                    Eff e1 Unit ->
                                                    Eff (atom :: ATOM | e2) Unit

-- | Encaspulates the Atom Package interface.
type AtomPackage = forall e. {
  activate :: (Eff (atom :: ATOM, console :: CONSOLE | e) Boolean)
}

-- | Sample action (outputs to console).
helloWorld :: forall eff. Eff (console :: CONSOLE | eff) Unit
helloWorld = log "HELLO WORLD!"

-- | Callback triggered when the plugin is first activated.
activate = do
  addTextEditorCommand "pst:Hello" helloWorld
  addTextEditorCommand "pst:Execute" helloWorld
  return true

-- | Main function that is called when this module is executed.
--   Simply re-exposes all of the required exports for the Atom package.
main = expose {
  activate: activate
}
