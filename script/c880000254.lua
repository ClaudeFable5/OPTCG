-- AUTO-GENERATED: OP02-010 / 도구라
-- rules_id=OP02-010 script_id=880000254 fingerprint=de6b8eb05434ff704815731bc7ef9cdc5168a63343a13056ef35483e504eed29
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[RED]],
              cost_eq=1,
              name_neq=[[도구라]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 패에서 「도구라」 이외의 코스트 1인 적색 캐릭터를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-010]],
    schema_version=1,
  })
end
