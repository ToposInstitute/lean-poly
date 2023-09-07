structure Poly where 
  pos : Type
  dir : pos -> Type

def constant (T : Type) : Poly := 
  {
    pos := T
    dir := λ _ ↦ Empty
  }

def one : Poly := constant Unit

def zero : Poly := constant Empty

def linear (T : Type) : Poly :=
  {
    pos := T
    dir :=λ _ ↦ Unit
    }

def yon : Poly := linear Unit

def monomial (P D : Type) : Poly :=
  {
    pos := P
    dir := λ _ ↦ D 
  }

def representable : Type -> Poly :=
  λ D ↦
  {
    pos := Unit
    dir := λ _ ↦ D
  }

----- Maps

def poly_map (P Q: Poly) : Type :=
  Σ (onPos : P.pos -> Q.pos), 
  (p : P.pos) -> Q.dir (onPos p) -> P.dir p

def constantMap {T T' : Type} : 
  (T -> T') -> poly_map (constant T) (constant T') :=
  λ f ↦ (sigma.mk f absurd) 

