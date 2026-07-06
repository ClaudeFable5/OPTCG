-- AUTO-GENERATED: OP01-094 / 카이도
-- rules_id=OP01-094 script_id=880000217 fingerprint=b758bb21b1b5778bdacae1cacf3064414b64386bb5bf28826dc1573514d2f591
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-094]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=0,
              filter={
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[ANY]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={
          {
            count=6,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-6(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 《백수 해적단》 특징을 가진 경우, 이 캐릭터 이외의 모든 캐릭터를 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-094]],
    schema_version=1,
  })
end
