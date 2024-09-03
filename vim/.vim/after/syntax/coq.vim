scriptencoding utf-8
highlight clear Conceal

syntax match coqSubscript keepend /\K\d\+/ms=s+1 transparent contains=coqSubscriptDigit
    \ containedin=ALLBUT,coqComment,coqRequire,coqSubscript,coqSubscriptDigit
syntax match coqSubscriptDigit /0/ conceal cchar=₀
syntax match coqSubscriptDigit /1/ conceal cchar=₁
syntax match coqSubscriptDigit /2/ conceal cchar=₂
syntax match coqSubscriptDigit /3/ conceal cchar=₃
syntax match coqSubscriptDigit /4/ conceal cchar=₄
syntax match coqSubscriptDigit /5/ conceal cchar=₅
syntax match coqSubscriptDigit /6/ conceal cchar=₆
syntax match coqSubscriptDigit /7/ conceal cchar=₇
syntax match coqSubscriptDigit /8/ conceal cchar=₈
syntax match coqSubscriptDigit /9/ conceal cchar=₉

syntax keyword Normal alpha conceal cchar=α
syntax keyword Normal beta conceal cchar=β
syntax keyword Normal Gamma conceal cchar=Γ
syntax keyword Normal gamma conceal cchar=γ
syntax keyword Normal Delta conceal cchar=Δ
syntax keyword Normal delta conceal cchar=δ
syntax keyword Normal epsilon conceal cchar=ε
syntax keyword Normal zeta conceal cchar=ζ
syntax keyword Normal eta conceal cchar=η
syntax keyword Normal Theta conceal cchar=ϴ
syntax keyword Normal theta conceal cchar=θ
syntax keyword Normal kappa conceal cchar=κ
syntax keyword Normal lambda conceal cchar=λ
syntax keyword Normal mu conceal cchar=μ
syntax keyword Normal nu conceal cchar=ν
syntax keyword Normal Xi conceal cchar=Ξ
syntax keyword Normal xi conceal cchar=ξ
syntax keyword Normal Pi conceal cchar=Π
syntax keyword Normal rho conceal cchar=ρ
syntax keyword Normal sigma conceal cchar=σ
syntax keyword Normal tau conceal cchar=τ
syntax keyword Normal upsilon conceal cchar=υ
syntax keyword Normal Phi conceal cchar=Φ
syntax keyword Normal phi conceal cchar=φ
syntax keyword Normal chi conceal cchar=χ
syntax keyword Normal Psi conceal cchar=Ψ
syntax keyword Normal psi conceal cchar=ψ
syntax keyword Normal Omega conceal cchar=Ω
syntax keyword Normal omega conceal cchar=ω
syntax keyword Normal nabla conceal cchar=∇

syntax keyword Normal \|\- conceal cchar=⊢
syntax keyword Normal True conceal cchar=⊤
syntax keyword Normal False conceal cchar=⊥
syntax keyword Normal -> conceal cchar=→
syntax keyword Normal --> conceal cchar=⟶
syntax keyword Normal <- conceal cchar=←
syntax keyword Normal <-- conceal cchar=⟵
syntax keyword Normal <-> conceal cchar=↔
syntax keyword Normal <--> conceal cchar=⟷
syntax keyword Normal => conceal cchar=⇒
syntax keyword Normal ==> conceal cchar=⟹
syntax keyword Normal <== conceal cchar=⟸
syntax keyword Normal ++> conceal cchar=⟿
syntax keyword Normal <++ conceal cchar=⬳
syntax keyword Normal fun conceal cchar=λ
syntax keyword Normal forall conceal cchar=∀
syntax keyword Normal exists conceal cchar=∃
syntax keyword Normal /\ conceal cchar=∧
syntax keyword Normal \/ conceal cchar=∨
syntax keyword Normal ~ conceal cchar=¬
syntax keyword Normal +- conceal cchar=±
syntax keyword Normal <= conceal cchar=≤
syntax keyword Normal >= conceal cchar=≥
syntax keyword Normal <> conceal cchar=≠
syntax keyword Normal * conceal cchar=×
syntax keyword Normal ++ conceal cchar=⧺
syntax keyword Normal nat conceal cchar=𝓝
syntax keyword Normal Z conceal cchar=ℤ
syntax keyword Normal N conceal cchar=ℕ
syntax keyword Normal Q conceal cchar=ℚ
syntax keyword Normal Real conceal cchar=ℝ
syntax keyword Normal bool conceal cchar=𝔹
syntax keyword Normal Prop conceal cchar=𝓟

syntax keyword Normal := conceal ≜
syntax keyword Normal Proof. conceal ∵
syntax keyword Normal :: conceal ∷
syntax keyword Normal Qed. conceal ■
syntax keyword Normal Defined. conceal □
syntax keyword Normal Time conceal ⏱
" syntax keyword Normal Fail conceal ⛐
syntax keyword Normal Admitted conceal 😱
