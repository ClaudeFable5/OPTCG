-- AUTO-GENERATED: OP09-068 / 토니토니 쵸파
-- rules_id=OP09-068 script_id=880001164 fingerprint=10cb6fed580e11e9eb410414e875073370bfdb0c83b532b3d18d9982c80b4cdd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-068]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            min_count=1,
            mode=[[AT_LEAST]],
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신 필드의 두웅!!을 1장 이상 두웅!! 덱으로 되돌릴 수 있다: 이 캐릭터를 액티브로 한다. 그 후, 다음 상대의 턴 종료 시까지, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-068]],
    schema_version=1,
  })
end
