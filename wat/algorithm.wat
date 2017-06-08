(module
  (table 0 anyfunc)
  (memory $0 4097)
  (export "memory" (memory $0))
  (export "getArrayOffset" (func $getArrayOffset))
  (export "check" (func $check))
  (export "bubbleSort" (func $bubbleSort))
  (func $getArrayOffset (result i32)
    (i32.const 16)
  )
  (func $check (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
    (select
      (i32.gt_s
        (get_local $1)
        (get_local $2)
      )
      (i32.lt_s
        (get_local $1)
        (get_local $2)
      )
      (i32.eq
        (get_local $0)
        (i32.const 1)
      )
    )
  )
  (func $bubbleSort (param $0 i32) (param $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (block $label$0
      (br_if $label$0
        (i32.lt_s
          (get_local $0)
          (i32.const 1)
        )
      )
      (block $label$1
        (br_if $label$1
          (i32.ne
            (get_local $1)
            (i32.const 1)
          )
        )
        (set_local $4
          (get_local $0)
        )
        (set_local $5
          (i32.const 1)
        )
        (loop $label$2
          (block $label$3
            (br_if $label$3
              (i32.ge_s
                (get_local $5)
                (get_local $0)
              )
            )
            (set_local $7
              (i32.load offset=16
                (i32.const 0)
              )
            )
            (set_local $6
              (i32.const 1)
            )
            (set_local $1
              (i32.const 16)
            )
            (loop $label$4
              (block $label$5
                (block $label$6
                  (br_if $label$6
                    (i32.le_s
                      (get_local $7)
                      (tee_local $2
                        (i32.load
                          (tee_local $3
                            (i32.add
                              (get_local $1)
                              (i32.const 4)
                            )
                          )
                        )
                      )
                    )
                  )
                  (i32.store
                    (get_local $1)
                    (get_local $2)
                  )
                  (i32.store
                    (i32.add
                      (get_local $1)
                      (i32.const 4)
                    )
                    (get_local $7)
                  )
                  (br $label$5)
                )
                (set_local $7
                  (get_local $2)
                )
              )
              (set_local $1
                (get_local $3)
              )
              (br_if $label$4
                (i32.ne
                  (get_local $4)
                  (tee_local $6
                    (i32.add
                      (get_local $6)
                      (i32.const 1)
                    )
                  )
                )
              )
            )
          )
          (set_local $4
            (i32.add
              (get_local $4)
              (i32.const -1)
            )
          )
          (set_local $1
            (i32.eq
              (get_local $5)
              (get_local $0)
            )
          )
          (set_local $5
            (i32.add
              (get_local $5)
              (i32.const 1)
            )
          )
          (br_if $label$2
            (i32.eqz
              (get_local $1)
            )
          )
          (br $label$0)
        )
      )
      (set_local $4
        (get_local $0)
      )
      (set_local $5
        (i32.const 1)
      )
      (loop $label$7
        (block $label$8
          (br_if $label$8
            (i32.ge_s
              (get_local $5)
              (get_local $0)
            )
          )
          (set_local $7
            (i32.load offset=16
              (i32.const 0)
            )
          )
          (set_local $1
            (i32.const 16)
          )
          (set_local $6
            (i32.const 1)
          )
          (loop $label$9
            (block $label$10
              (block $label$11
                (br_if $label$11
                  (i32.ge_s
                    (get_local $7)
                    (tee_local $2
                      (i32.load
                        (tee_local $3
                          (i32.add
                            (get_local $1)
                            (i32.const 4)
                          )
                        )
                      )
                    )
                  )
                )
                (i32.store
                  (get_local $1)
                  (get_local $2)
                )
                (i32.store
                  (i32.add
                    (get_local $1)
                    (i32.const 4)
                  )
                  (get_local $7)
                )
                (br $label$10)
              )
              (set_local $7
                (get_local $2)
              )
            )
            (set_local $1
              (get_local $3)
            )
            (br_if $label$9
              (i32.ne
                (get_local $4)
                (tee_local $6
                  (i32.add
                    (get_local $6)
                    (i32.const 1)
                  )
                )
              )
            )
          )
        )
        (set_local $4
          (i32.add
            (get_local $4)
            (i32.const -1)
          )
        )
        (set_local $1
          (i32.eq
            (get_local $5)
            (get_local $0)
          )
        )
        (set_local $5
          (i32.add
            (get_local $5)
            (i32.const 1)
          )
        )
        (br_if $label$7
          (i32.eqz
            (get_local $1)
          )
        )
      )
    )
  )
)
