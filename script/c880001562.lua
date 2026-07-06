-- AUTO-GENERATED: OP12-109 / 파시피스타
-- rules_id=OP12-109 script_id=880001562 fingerprint=fcae2e3f16e6654fb7f2423e9c23c72866af075d436f1901b2019ddf7093d946
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-109]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[ADD_SELF_TO_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 1 이하인 캐릭터를 1장까지 KO 시키고, 이 카드를 패에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-109]],
    schema_version=1,
  })
end
