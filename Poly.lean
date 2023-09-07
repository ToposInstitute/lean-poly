structure Poly where 
  pos : Type
  dir : pos -> Type

def constPoly : Type -> Poly := 
  λ T ↦ 
  {
    pos := T
    dir := λ _ ↦ Empty
  }

def one : Poly := constPoly Unit

def zero : Poly := constPoly Empty

def linearPoly : Type -> Poly :=
  λ T ↦ 
  {
    pos := T
    dir :=λ _ ↦ Unit
    }

def monomial : Type -> Type -> Poly :=
  λ P D ↦ 
  {
    pos := P
    dir := λ _ ↦ D 
  }