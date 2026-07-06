-- AUTO-GENERATED: OP05-023 / 베르고
-- rules_id=OP05-023 script_id=880000635 fingerprint=03945559f9dc73ed3fa593b97e10e563762ecae5f9a1d4b886d6547c27762e46
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】상대의 레스트 상태이고 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-023]],
    schema_version=1,
  })
end
