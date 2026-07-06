-- AUTO-GENERATED: OP10-035 / 브룩
-- rules_id=OP10-035 script_id=880001250 fingerprint=46a040f4d075d6ac2fb042f48e586acdf4eeabf313ad56131a44616e6b1cce99
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-035]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                character_cost_lte=5,
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 리더 또는 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-035]],
    schema_version=1,
  })
end
