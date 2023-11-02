# lean-poly

## Getting Started

We highly recommend using Lean with VSCode. More information about Lean and its VSCode features can be found [here](https://lean-lang.org/reference/using_lean.html).

1. Install [VSCode](https://code.visualstudio.com/download).
2. Install [Lean](https://leanprover-community.github.io/get_started.html).
3. Install [Lean4 extension](https://github.com/leanprover/vscode-lean4) in VSCode.
4. Clone this git repository.
    ```
    git clone git@github.com:ToposInstitute/lean-poly.git
    ```
5. Install Lean packages using `lake` (lean make) and restart VSCode.
    ```
    cd lean-poly
    lake update
    lake exe cache get
    code .
    ```

## Updating Lean

If you are getting the `unknown package Mathlib` error, the version of Lean you are using in VSCode could be different from that specified in the file `lean-toolchain` in the repository.

1. Update `elan` which is the Lean version manager.
    ```
    elan self update
    ```
2. Make `lean4:stable` the default version.
    ```
    elan default leanprover/lean4:stable
    ```
3. Update dependencies to their latest versions using `lake` (lean make).
    ```
    lake update
    ```
4. Get cached precompiled `olean` files for dependencies.
    ```
    lake exe cache get
    ```
5. You may be asked at the end of the last command to update the `lean-toolchain` file so that it matches the Lean version of the updated dependencies.
    ```
    cp lake-packages/mathlib/lean-toolchain ./lean-toolchain
    ```
6. Restart VS Code to make sure the correct Lean interpreter and server is running.

## Initialization

This is a record of how this project was created using `lake`. The steps were taken from these [notes](https://leanprover-community.github.io/install/project.html). Please do not repeat these steps in the repository.

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