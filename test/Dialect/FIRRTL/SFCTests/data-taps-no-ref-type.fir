; RUN: firtool -lower-annotations-no-ref-type-ports %s | FileCheck %s
; RUN: firtool -probes-to-signals %s | FileCheck %s

FIRRTL version 4.0.0
circuit Foo: %[[
  {
    "class": "sifive.enterprise.grandcentral.DataTapsAnnotation",
    "keys": [
      {
        "class": "sifive.enterprise.grandcentral.ReferenceDataTapKey",
        "source": "~Foo|Foo/bar:Bar>a",
        "sink": "~Foo|Foo/baz:Baz>a"
      }
    ]
  },
  {
    "class": "firrtl.transforms.DontTouchAnnotation",
    "target": "~Foo|Bar>a"
  },
  {
    "class": "firrtl.transforms.DontTouchAnnotation",
    "target": "~Foo|Baz>a"
  }
]]
  module Bar:
    wire a: UInt<1>
    invalidate a

  module Baz:
    wire a: UInt<1>
    invalidate a

  public module Foo:

    inst bar of Bar
    inst baz of Baz

    ; CHECK:      module Bar
    ; CHECK-NEXT:   output

    ; CHECK:      module Baz
    ; CHECK-NEXT:   input
