# Example Atom Package in Purescript

This repository is a WIP/hack to see how hard it is to develop Atom packages
using Purescript. It is by no means finished/nice code and instead represents
an experiment (that is hopefully useful to others).

## Development Setup

For development - it is useful to use a symlink to link this directory to
your Atom packages directory. This allows you to make changes and simply reload
Atom to see your changes.

    ln -s . ~/.atom/packages/atom-ps

## Building/Getting Started

This example uses [Pulp](https://github.com/bodil/pulp) as the build tool, and
compiles the Purescript module to a single JS file (`lib/main.js`).

To get started - run:

    pulp build --main PurescriptTest -O --to lib/main.js

When Atom runs (and the package is triggered by running `pst:dev`), it will
execute the transpiled Purescript file. This will evaluate `PurescriptTest.main`
which is responsible for re-exporting the API/interface required by Atom (see
`PurescriptTest.expose`). Atom will then execute the functions on the *exposed*
interface.

This setup means that Purescript performs optimizations (dead code elimination),
and we don't have to mess around with the CommonJS module system (which has some
weird effects when used with Atom).
