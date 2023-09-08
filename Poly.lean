structure Poly where 
  pos : Type
  dir : pos -> Type

def monomial (P D : Type) : Poly :=
  {
    pos := P
    dir := λ _ ↦ D 
  }

def const (P : Type) : Poly := monomial P Empty
def linear (P : Type) : Poly := monomial P Unit
def poly1 : Poly := const Unit
def poly0 : Poly := const Empty
def yon : Poly := linear Unit

def representable (D : Type) : Poly := monomial Unit D

def bang1 {T : Type} : T -> Unit := λ _ ↦ Unit.unit 
def ident {T : Type} : T -> T := λ t ↦ t

------------- Maps ------------

def polymap (p q: Poly) : Type :=
  Σ (onPos : p.pos -> q.pos), 
  (P : p.pos) -> q.dir (onPos P) -> p.dir P

def constantMap {T T' : Type} : 
  (T -> T') -> polymap (const T) (const T') :=
  λ f ↦ (Sigma.mk f λ _ ↦ Empty.rec ) --I don't know how to map out of empty type

def linearMap {T T' : Type} : (T -> T') -> polymap (linear T) (linear T') :=
  λ f ↦ (Sigma.mk f λ _ _ ↦ Unit.unit)

def representableMap {T T' : Type} : (T -> T') -> polymap (representable T') (representable T) :=
  λ f ↦ (Sigma.mk bang1 λ _ ↦ f)

def polyid {p : Poly} : polymap p p :=
  (Sigma.mk (ident) λ _ ↦ ident)

def bang0poly {p : Poly} : polymap poly0 p  := 
  (Sigma.mk Empty.rec Empty.rec) 
def bang1poly {P : Poly} : polymap P poly1 := (Sigma.mk bang1 λ _ ↦ Empty.rec)

def composemap {p q r : Poly} : (polymap p q) -> (polymap q r) -> (polymap p r) :=
  λ f g ↦ 
  let onPos : p.pos -> r.pos := g.fst ∘ f.fst
  let onDir : (P : p.pos) -> (r.dir $ onPos P) -> (p.dir P) := λ P rd ↦ (f.snd P $ g.snd (f.fst P) rd)
  (Sigma.mk onPos onDir)

