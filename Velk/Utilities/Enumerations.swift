//
//  Enumerations.swift
//  Velk
//
//  Created by Dom Parsons on 21/10/2023.
//

import Foundation
import CodeEditor

enum ProgrammingLanguage: String, CaseIterable {
    case _1c
    case abnf
    case accesslog
    case actionscript
    case ada
    case angelscript
    case apache
    case applescript
    case arcade
    case arduino
    case armasm
    case asciidoc
    case aspectj
    case autohotkey
    case autoit
    case avrasm
    case awk
    case axapta
    case bash
    case basic
    case bnf
    case brainfuck
    case cal
    case capnproto
    case ceylon
    case clean
    case clojure
    case cmake
    case coffeescript
    case coq
    case cos
    case cpp
    case crmsh
    case crystal
    case cs
    case csp
    case css
    case d
    case dart
    case delphi
    case diff
    case django
    case dns
    case dockerfile
    case dos
    case dsconfig
    case dts
    case dust
    case ebnf
    case elixir
    case elm
    case erb
    case erlang
    case excel
    case fix
    case flix
    case fortran
    case fsharp
    case gams
    case gauss
    case gcode
    case gherkin
    case glsl
    case gml
    case go
    case golo
    case gradle
    case groovy
    case haml
    case handlebars
    case haskell
    case haxe
    case hsp
    case htmlbars
    case http
    case hy
    case inform7
    case ini
    case irpf90
    case isbl
    case java
    case javascript
    case json
    case julia
    case kotlin
    case lasso
    case ldif
    case leaf
    case less
    case lisp
    case livecodeserver
    case livescript
    case llvm
    case lsl
    case lua
    case makefile
    case markdown
    case mathematica
    case matlab
    case maxima
    case mel
    case mercury
    case mipsasm
    case mizar
    case mojolicious
    case monkey
    case moonscript
    case n1ql
    case nginx
    case nimrod
    case nix
    case nsis
    case objectivec
    case ocaml
    case openscad
    case oxygene
    case parser3
    case perl
    case pf
    case pgsql
    case php
    case plaintext
    case pony
    case powershell
    case processing
    case profile
    case prolog
    case properties
    case protobuf
    case puppet
    case purebasic
    case python
    case q
    case qml
    case r
    case reasonml
    case rib
    case roboconf
    case routeros
    case rsl
    case ruby
    case ruleslanguage
    case rust
    case sas
    case scala
    case scheme
    case scilab
    case scss
    case shell
    case smali
    case smalltalk
    case sml
    case sqf
    case sql
    case stan
    case stata
    case step21
    case stylus
    case subunit
    case swift
    case taggerscript
    case tap
    case tcl
    case tex
    case thrift
    case tp
    case twig
    case typescript
    case vala
    case vbnet
    case vbscript
    case verilog
    case vhdl
    case vim
    case x86asm
    case xl
    case xml
    case xquery
    case yaml
    case zephir
}

extension ProgrammingLanguage {
    func toCodeEditorLanguage() -> CodeEditor.Language {
        return CodeEditor.Language(rawValue: self.rawValue) 
        
    }
}

enum Theme: String, CaseIterable {
    case A11YDark = "A11Y-Dark"
    case A11YLight = "A11Y-Light"
    case Agate
    case AnOldHope = "An-Old-Hope"
    case Androidstudio
    case ArduinoLight = "Arduino-Light"
    case Arta
    case Ascetic
    case AtelierCaveDark = "Atelier-Cave-Dark"
    case AtelierCaveLight = "Atelier-Cave-Light"
    case AtelierDuneDark = "Atelier-Dune-Dark"
    case AtelierDuneLight = "Atelier-Dune-Light"
    case AtelierEstuaryDark = "Atelier-Estuary-Dark"
    case AtelierEstuaryLight = "Atelier-Estuary-Light"
    case AtelierForestDark = "Atelier-Forest-Dark"
    case AtelierForestLight = "Atelier-Forest-Light"
    case AtelierHeathDark = "Atelier-Heath-Dark"
    case AtelierHeathLight = "Atelier-Heath-Light"
    case AtelierLakesideDark = "Atelier-Lakeside-Dark"
    case AtelierLakesideLight = "Atelier-Lakeside-Light"
    case AtelierPlateauDark = "Atelier-Plateau-Dark"
    case AtelierPlateauLight = "Atelier-Plateau-Light"
    case AtelierSavannaDark = "Atelier-Savanna-Dark"
    case AtelierSavannaLight = "Atelier-Savanna-Light"
    case AtelierSeasideDark = "Atelier-Seaside-Dark"
    case AtelierSeasideLight = "Atelier-Seaside-Light"
    case AtelierSulphurpoolDark = "Atelier-Sulphurpool-Dark"
    case AtelierSulphurpoolLight = "Atelier-Sulphurpool-Light"
    case AtomOneDark = "Atom-One-Dark"
    case AtomOneDarkReasonable = "Atom-One-Dark-Reasonable"
    case AtomOneLight = "Atom-One-Light"
    case BrownPaper = "Brown-Paper"
    case CodepenEmbed = "Codepen-Embed"
    case ColorBrewer = "Color-Brewer"
    case Darcula
    case Dark
    case Darkula
    case Default
    case Docco
    case Dracula
    case Far
    case Foundation
    case Github
    case GithubGist = "Github-Gist"
    case Gml
    case Googlecode
    case Grayscale
    case GruvboxDark = "Gruvbox-Dark"
    case GruvboxLight = "Gruvbox-Light"
    case Hopscotch
    case Hybrid
    case Idea
    case IrBlack = "Ir-Black"
    case IsblEditorDark = "Isbl-Editor-Dark"
    case IsblEditorLight = "Isbl-Editor-Light"
    case KimbieDark = "Kimbie.Dark"
    case KimbieLight = "Kimbie.Light"
    case Lightfair
    case Magula
    case MonoBlue = "Mono-Blue"
    case Monokai
    case MonokaiSublime = "Monokai-Sublime"
    case Nord
    case Obsidian
    case Ocean
    case ParaisoDark = "Paraiso-Dark"
    case ParaisoLight = "Paraiso-Light"
    case Pojoaque
    case Purebasic
    case QtcreatorDark = "Qtcreator_Dark"
    case QtcreatorLight = "Qtcreator_Light"
    case Railscasts
    case Rainbow
    case Routeros
    case SchoolBook = "School-Book"
    case ShadesOfPurple = "Shades-Of-Purple"
    case SolarizedDark = "Solarized-Dark"
    case SolarizedLight = "Solarized-Light"
    case Sunburst
    case Tomorrow
    case TomorrowNight = "Tomorrow-Night"
    case TomorrowNightBlue = "Tomorrow-Night-Blue"
    case TomorrowNightBright = "Tomorrow-Night-Bright"
    case TomorrowNightEighties = "Tomorrow-Night-Eighties"
    case Vs
    case Vs2015
    case Xcode
    case Xt256
    case Zenburn
}

extension Theme {
    func toCodeEditorTheme() -> CodeEditor.ThemeName {
        return CodeEditor.ThemeName(rawValue: self.rawValue)
    }
}
