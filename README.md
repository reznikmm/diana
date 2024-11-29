# Diana

[![Build with Alire](https://github.com/reznikmm/diana/actions/workflows/alire.yml/badge.svg)](https://github.com/reznikmm/diana/actions/workflows/alire.yml)

> A translator for Ada 83 to Diana with tools for using Diana

Diana is a translator for Ada 83 to Diana, accompanied by tools
for working with Diana. It was originally developed by William
Easton of Peregrine Systems, Inc. This repository contains a copy
of the original software and a modified version for easier
integration with the [Alire](https://alire.ada.dev/) package manager.

## Repository Structure

- **`origin` branch**: Contains the original release of the
  software, preserved in its unmodified form.
- **`main` branch**: Contains modifications to the original
  release to enable easier usage with Alire.

## Abstract

### Ada/Diana Front End Tools

This software system is an Ada front end, that is a system
which translates Ada into Diana, together with associated
tools for use of the Diana.

The front end is to be considered a prototype version.
It presently converts statically correct Ada to the corresponding
Diana representation; there is no guarantee that statically
incorrect programs will be diagnosed as such. (It is the
intention to replace this front end with a production-quality
version which will also diagnose statically incorrect programs.)

The language accepted is the entire Ada language, including
library support, generics, etc., but not (yet) including any
of the Chapter 13 optional features. The requirement is that
the front end accept the ACVC class A and class C tests.

The implementation of Diana uses a software virtual memory,
implemented as a DIRECT_IO file with fixed-size pages. Diana
nodes are represented as pointers into this file; the current
implementation of a pointer is a record containing a node type,
a page number and a location within a page. (Of course,
it is strongly recommended that the details of the current
implementation not be relied upon.) The definition of the Diana
is given in IDL form and matches the Intermetrics 1986 draft
definition of Diana (rather than that published in 1983).
Program access to Diana nodes and attributes is given by
an Ada packages (actually, three packages) very similar
 to that given in the 1983 Diana specification.

The system includes utilities for processing the IDL specification
of Diana to produce programs and packages required for using Diana.
It also includes a LALR grammar generator (similar in scope to yacc,
but implemented in Ada and tailored to the present project).
In addition, a tool for printing the Diana in an indented format
is included.

The system consists of about 35,000 lines of Ada source, probably
about 15,000 Ada statements. Because of the virtual-memory implementation,
there should be no arbitrary small limitations due to main memory table sizes. 

## Licensing

The original release included the following prologue:

```
This prologue must be included in all copies of this software.
Restrictions on use or distribution:  NONE
```

Based on this statement, we have added the
[Unlicense](https://unlicense.org/) license file, which closely
aligns with the lack of restrictions on usage or distribution
expressed in the original prologue.

## Disclaimer

This software and its documentation are provided "AS IS" and
without any expressed or implied warranties whatsoever.  No warranties
as to performance, merchantability, or fitness for a particular
purpose exist.

The user is advised to test the software thoroughly before
relying on it.  The user must assume the entire risk and liability of
using this software.  In no event shall any person or organization of
people be held responsible for any direct, indirect, consequential or
inconsequential damages or lost profits.

## How to Use

1. To use the modified version with Alire, clone the repository and
   switch to the `main` branch.
2. For historical reference or to work with the original version,
   switch to the `origin` branch.

## Contributions

Contributions are welcome to further improve compatibility, documentation,
and tools for using Diana. Please submit pull requests or issues if you
encounter problems or have suggestions.


