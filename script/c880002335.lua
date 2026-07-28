-- AUTO-GENERATED: OP15-033 / 호디 존스
-- rules_id=OP15-033 script_id=880002335 fingerprint=e545b50872da37bb77c757a4027fd4d7d59f71844899299bf43ec7d548875b2e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                trait=[[어인족]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 《어인족》 특징을 가진 리더를 액티브로 한다. 그 후, 자신의 라이프 위에서 1장을 패에 넣는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-033]],
    schema_version=1,
  })
end
