-- AUTO-GENERATED: OP02-105 / 타시기
-- rules_id=OP02-105 script_id=880000350 fingerprint=9a5cd9d8e9666ce160ee794df50077c1b7fd90b79bf9d1968c1289c09318cb10
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-105]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
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
        source_text=[[【두웅!!×1】【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -3.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-105]],
    schema_version=1,
  })
end
