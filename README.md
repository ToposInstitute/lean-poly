# lean-poly

## Getting Started

We highly recommend using Lean with VSCode. More information about Lean and its VSCode features can be found [here](https://lean-lang.org/reference/using_lean.html).

1. Install [VSCode](https://code.visualstudio.com/download).
2. Install [Lean](https://leanprover-community.github.io/get_started.html).
3. Install VSCode [Lean4 extension](https://github.com/leanprover/vscode-lean4). Even though the extension installs some version of Lean, please follow Step 2 above to ensure you get the full capabilities of Lean.
4. Clone this git repository.
    ```
    git clone git@github.com:ToposInstitute/lean-poly.git
    ```
5. Install Lean packages using `lake` (lean make) and start VSCode.
    ```
    cd lean-poly
    lake update
    lake exe cache get
    code .
    ```

## Initialization

This is a record of how this project was created using `lake`. Please do not repeat these steps in the repository.

1. Create project with `mathlib`.
    ```
    lake +leanprover/lean4:nightly-2023-02-04 new lean-poly math
    ```
2. Update packages with `lake` (lean make).
    ```
    lake update
    ```
3. Cache package executables.
    ```
    lake exe cache get
    ```