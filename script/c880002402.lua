-- AUTO-GENERATED: OP15-100 / 카마키리
-- rules_id=OP15-100 script_id=880002402 fingerprint=39f69bdb38aa35ac354e2ed48d3386e8ffd2e5936577576fd7346e62a75c3147
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이 캐릭터를 트래시에 놓고, 자신의 라이프 위에서 1장을 패에 넣을 수 있다: 상대의 코스트 6 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-100]],
    schema_version=1,
  })
end
