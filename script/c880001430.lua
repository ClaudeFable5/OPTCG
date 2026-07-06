-- AUTO-GENERATED: OP11-096 / 리퍼
-- rules_id=OP11-096 script_id=880001430 fingerprint=fe85e4411c590aeeff5cf6fde0556d0e0b29a0b51a98afc3b78f1000e27772a6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-096]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              color=[[BLACK]],
              name_neq=[[리퍼]],
              trait=[[해군]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[「리퍼」 이외의 자신의 흑색인 《해군》 특징을 가진 캐릭터가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-096]],
    schema_version=1,
  })
end
