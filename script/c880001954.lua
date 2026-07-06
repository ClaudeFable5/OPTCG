-- AUTO-GENERATED: ST21-014 / 몽키 D. 루피
-- rules_id=ST21-014 script_id=880001954 fingerprint=aec920681618976991d8bd99636cbb8aa9a8e9703ebb9b52aff99ebcbdd3ec32
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST21-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[ST21-014]],
    schema_version=1,
  })
end
